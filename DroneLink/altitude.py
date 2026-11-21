import time
from pymavlink import mavutil
from .utilities import wait_command_ack, wait_altitude, wait_for_message


def take_off(master, router, alt=10.0):
    master.mav.command_long_send(
        master.target_system, master.target_component,
        mavutil.mavlink.MAV_CMD_NAV_TAKEOFF,
        0, 0, 0, 0, 0, 0, 0, float(alt))

    result = wait_command_ack(router, mavutil.mavlink.MAV_CMD_NAV_TAKEOFF)
    if result is None:
        raise RuntimeError("Нет COMMAND_ACK для TAKEOFF")
    if result != mavutil.mavlink.MAV_RESULT_ACCEPTED:
        raise RuntimeError(f"TAKEOFF отклонён, result={result}")

    got = wait_altitude(router, 5.0)
    if got is None:
        raise RuntimeError("Не набрали 5 метров за отведённое время")
    return True


def change_altitude(master, router, target_alt_m, current_lat, current_lon,
                    rate_hz=2, timeout=15):
    """Изменяет высоту через SET_POSITION_TARGET_GLOBAL_INT."""
    type_mask = 0b0000111111111000
    start = time.time()
    last_sent = 0.0
    last_alt = None

    while time.time() - start < timeout:
        if time.time() - last_sent >= 1.0 / rate_hz:
            master.mav.set_position_target_global_int_send(
                0,
                master.target_system,
                master.target_component,
                mavutil.mavlink.MAV_FRAME_GLOBAL_RELATIVE_ALT_INT,
                type_mask,
                int(current_lat * 1e7),
                int(current_lon * 1e7),
                float(target_alt_m),
                0, 0, 0,
                0, 0, 0,
                0, 0)
            last_sent = time.time()

        msg = wait_for_message(
            router,
            lambda m: m.get_type() == 'GLOBAL_POSITION_INT',
            timeout=0.2)
        if msg is not None:
            last_alt = msg.relative_alt / 1000.0
            if abs(last_alt - target_alt_m) < 0.5:
                return True

        time.sleep(0.05)

    print(f"Не достигли высоты {target_alt_m} м за {timeout} с "
          f"(текущая {last_alt})")
    return False