import threading
import time

from pymavlink import mavutil


class MessageRouter:
    """Единственный владелец recv_match. Раздаёт сообщения подписчикам."""

    def __init__(self, master):
        self.master = master
        self._subs = []
        self._lock = threading.Lock()
        self._thread = None
        self._stopped = threading.Event()

    def subscribe(self, handler):
        """handler(msg) -> None. Вызывается из потока роутера."""
        with self._lock:
            self._subs.append(handler)

    def unsubscribe(self, handler):
        with self._lock:
            if handler in self._subs:
                self._subs.remove(handler)

    def start(self):
        if self._thread is not None or self._stopped.is_set():
            return
        self._thread = threading.Thread(
            target=self._loop, daemon=True, name="mavlink-router")
        self._thread.start()

    def close(self):
        self._stopped.set()
        close = getattr(self.master, "close", None)
        if close is not None:
            close()

    def _loop(self):
        while not self._stopped.is_set():
            try:
                msg = self.master.recv_match(blocking=True, timeout=0.5)
                if msg is None:
                    continue
                with self._lock:
                    subs = list(self._subs)
                for h in subs:
                    try:
                        h(msg)
                    except Exception as e:
                        print(f"[router] handler error: {e}")
            except Exception as e:
                print(f"[router] loop error: {e}")
                time.sleep(0.5)


class TelemetryCollector:
    """Подписчик на MessageRouter, копит поля в DroneTelemetry."""

    def __init__(self, router):
        self.router = router
        self.latest = {}
        self._lock = threading.Lock()
        router.subscribe(self._on_msg)

    def _on_msg(self, msg):
        t = msg.get_type()
        fields = {}
        if t == 'HEARTBEAT':
            fields['armed'] = bool(
                msg.base_mode & mavutil.mavlink.MAV_MODE_FLAG_SAFETY_ARMED)
            try:
                fields['mode'] = mavutil.mode_string_v10(msg)
            except (AttributeError, TypeError, ValueError):
                fields['mode'] = str(msg.custom_mode)
            fields['flight_mode'] = str(msg.custom_mode)
        elif t == 'GPS_RAW_INT':
            fields['gps_lat'] = msg.lat / 1e7
            fields['gps_lon'] = msg.lon / 1e7
            fields['gps_alt'] = msg.alt / 1000.0
            fields['gps_fix_type'] = msg.fix_type
            fields['gps_satellites'] = msg.satellites_visible
        elif t == 'LOCAL_POSITION_NED':
            fields['position_ned_x'] = msg.x
            fields['position_ned_y'] = msg.y
            fields['position_ned_z'] = msg.z
            fields['velocity_ned_x'] = msg.vx
            fields['velocity_ned_y'] = msg.vy
            fields['velocity_ned_z'] = msg.vz
        elif t == 'GLOBAL_POSITION_INT':
            fields['relative_altitude_m'] = msg.relative_alt / 1000.0
        elif t == 'VFR_HUD':
            fields['heading_deg'] = msg.heading
        elif t == 'ATTITUDE':
            fields['imu_roll'] = msg.roll
            fields['imu_pitch'] = msg.pitch
            fields['imu_yaw'] = msg.yaw
        elif t == 'RAW_IMU':
            fields['imu_accel_x'] = msg.xacc
            fields['imu_accel_y'] = msg.yacc
            fields['imu_accel_z'] = msg.zacc
            fields['imu_gyro_x'] = msg.xgyro
            fields['imu_gyro_y'] = msg.ygyro
            fields['imu_gyro_z'] = msg.zgyro
        elif t == 'SYS_STATUS':
            fields['battery_voltage_v'] = msg.voltage_battery / 1000.0
            fields['battery_current_a'] = msg.current_battery / 100.0
            fields['battery_remaining_pct'] = msg.battery_remaining
            fields['cpu_load_percent'] = msg.load / 10.0
            fields['comm_drop_rate'] = msg.drop_rate_comm / 100.0
        elif t == 'BATTERY_STATUS':
            fields['battery_temperature_c'] = msg.temperature / 100.0
            fields['current_consumed_mah'] = (
                msg.current_consumed if msg.current_consumed >= 0
                else float('nan'))
        elif t == 'MEMINFO':
            fields['freemem_bytes'] = msg.freemem
        elif t == 'VIBRATION':
            fields['vibration_x'] = msg.vibration_x
            fields['vibration_y'] = msg.vibration_y
            fields['vibration_z'] = msg.vibration_z
        elif t == 'SCALED_PRESSURE':
            fields['pressure_hpa'] = msg.press_abs
            fields['temperature_c'] = msg.temperature / 100.0
        if fields:
            with self._lock:
                self.latest.update(fields)

    def snapshot(self):
        with self._lock:
            return dict(self.latest)


def start_telemetry(router, call, dump_period=60.0, heartbeat_period=1.0,
                    master=None, collector=None):
    """Запускает периодический дамп через callback call(snapshot_dict).

    master нужен для отправки GCS HEARTBEAT (чтобы SITL не уходил в failsafe).
    """
    collector = collector or TelemetryCollector(router)

    def heartbeat_loop():
        last_hb = 0.0
        while True:
            now = time.time()
            if master is not None and now - last_hb >= heartbeat_period:
                master.mav.heartbeat_send(
                    mavutil.mavlink.MAV_TYPE_GCS,
                    mavutil.mavlink.MAV_AUTOPILOT_INVALID,
                    0, 0, 0)
                last_hb = now
            time.sleep(0.2)

    def dump_loop():
        last = time.time()
        while True:
            now = time.time()
            if now - last >= dump_period:
                call(collector.snapshot())  # ← копия, не живой dict
                last = now
            time.sleep(0.2)

    threading.Thread(target=heartbeat_loop, daemon=True,
                     name="gcs-heartbeat").start()
    threading.Thread(target=dump_loop, daemon=True,
                     name="telemetry-dump").start()
    return collector