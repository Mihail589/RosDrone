from pymavlink import mavutil
from .get_gps import *
from .altitude import *
from .land import *
from .moving import *
from .telemetry import *
from .servo import *
from .utilities import (apply_intervals, wait_mode, wait_command_ack,
                        wait_armed)


class DroneLink:
    def __init__(self, device: str, switch_to_guided: bool = True):
        self.master = mavutil.mavlink_connection(device)
        self.master.wait_heartbeat()
        print(f"Heartbeat from system "
              f"({self.master.target_system}, "
              f"{self.master.target_component})")

        # ВАЖНО: роутер поднимается ПЕРВЫМ, до любых ожиданий.
        self.router = MessageRouter(self.master)
        self.router.start()

        # Запрос потоков + интервалов идёт через master.mav, не через recv
        #self.gps()
        self.master.mav.request_data_stream_send(
            self.master.target_system, self.master.target_component,
            mavutil.mavlink.MAV_DATA_STREAM_POSITION, 4, 1)
        apply_intervals(self.master, interval_us=1_000_000)

        if switch_to_guided:
            self.master.mav.set_mode_send(
                self.master.target_system,
                mavutil.mavlink.MAV_MODE_FLAG_CUSTOM_MODE_ENABLED, 4)
            if not wait_mode(self.router, 4):
                raise RuntimeError("Не удалось переключиться в GUIDED")

        self.telemetry = TelemetryCollector(self.router)

    def gps(self):
        return get_gps(self.router)   # теперь через роутер, не через master

    def arm_motors(self):
        if True:
            self.master.mav.set_mode_send(
                self.master.target_system,
                mavutil.mavlink.MAV_MODE_FLAG_CUSTOM_MODE_ENABLED, 4)
            if not wait_mode(self.router, 4):
                raise RuntimeError("Не удалось переключиться в GUIDED")
        self.master.mav.command_long_send(
            self.master.target_system, self.master.target_component,
            mavutil.mavlink.MAV_CMD_COMPONENT_ARM_DISARM,
            0, 1, 0, 0, 0, 0, 0, 0)
        result = wait_command_ack(
            self.router, mavutil.mavlink.MAV_CMD_COMPONENT_ARM_DISARM)
        if result != mavutil.mavlink.MAV_RESULT_ACCEPTED:
            return False
        return wait_armed(self.router, True)

    def disarm_motors(self, timeout=10.0):
        self.master.mav.command_long_send(
            self.master.target_system, self.master.target_component,
            mavutil.mavlink.MAV_CMD_COMPONENT_ARM_DISARM,
            0, 0, 0, 0, 0, 0, 0, 0)
        result = wait_command_ack(
            self.router, mavutil.mavlink.MAV_CMD_COMPONENT_ARM_DISARM)
        if result != mavutil.mavlink.MAV_RESULT_ACCEPTED:
            return False
        return wait_armed(self.router, False, timeout=timeout)

    def force_disarm(self):
        """
        Принудительно дизармирует дрон (в том числе в полёте).
        """
        self.master.mav.command_long_send(
            self.master.target_system,
            self.master.target_component,
            mavutil.mavlink.MAV_CMD_COMPONENT_ARM_DISARM,
            0,      # confirmation
            0,      # param1: 0 = disarm
            21196,  # param2: 21196 = force disarm (принудительно)
            0, 0, 0, 0, 0
        )

    def take_off(self, alt=10.0):
        return take_off(self.master, self.router, alt)

    def change_altitude(self, altitude):
        lat, lon = self.gps()
        return change_altitude(self.master, self.router, altitude, lat, lon)

    def move_coords(self, lat, lng, alt=10.0):
        return move_coords(self.master, self.router, lat, lng, alt)

    def goto_local_offset(self, north_m, east_m, up_m, **kwargs):
        return goto_local_offset(
            self.master, self.router, north_m, east_m, up_m, **kwargs)

    def rtl(self):
        return rtl(self.master, self.router)

    def land(self):
        return land(self.master, self.router)

    def start_telemetry(self, func, dump_period=60.0):
        return start_telemetry(self.router, func,
                               dump_period=dump_period,
                               master=self.master,
                               collector=self.telemetry)

    def close(self):
        self.router.close()

    def send_body_velocity(self, vx, vy, vz, duration):
        """Скорость в MAV_FRAME_BODY_OFFSET_NED. vx=вперёд, vz=вниз."""
        type_mask = 0b0000111111000111
        msg = self.master.mav.set_position_target_local_ned_encode(
            0, 0, 0,
        mavutil.mavlink.MAV_FRAME_BODY_OFFSET_NED,
        type_mask,
        0, 0, 0,
        vx, vy, vz,
        0, 0, 0, 0, 0)
        print(f"Движение: Vx={vx}, Vy={vy}, Vz={vz} в течение {duration} сек.")
        start = time.time()
        while time.time() - start < duration:
            self.master.mav.send(msg)
            time.sleep(1)

    def set_servo(self, servo_channel, pwm_value):
        return set_servo_pwm(self.master, servo_channel, pwm_value)