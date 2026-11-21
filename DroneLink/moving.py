import math
import time
from pymavlink import mavutil
from .utilities import wait_command_ack, wait_for_message


def _haversine_m(lat1, lon1, lat2, lon2):
    R = 6378137.0
    p1 = math.radians(lat1)
    p2 = math.radians(lat2)
    dp = math.radians(lat2 - lat1)
    dl = math.radians(lon2 - lon1)
    a = math.sin(dp / 2) ** 2 + math.cos(p1) * math.cos(p2) * math.sin(dl / 2) ** 2
    return 2 * R * math.asin(math.sqrt(a))


def wait_arrival(router, target_lat, target_lon, target_alt,
                 tolerance_m=1.5, tolerance_alt_m=1.0,
                 timeout=120.0, settle_time=2.0):
    """Ждёт прибытия в глобальную точку. Всё чтение — через роутер."""
    start = time.time()
    stable_since = None
    last_dist = float("inf")
    last_alt = 0.0

    while time.time() - start < timeout:
        msg = wait_for_message(
            router,
            lambda m: m.get_type() == 'GLOBAL_POSITION_INT',
            timeout=1.0)
        if msg is None:
            continue

        cur_lat = msg.lat / 1e7
        cur_lon = msg.lon / 1e7
        last_alt = msg.relative_alt / 1000.0

        last_dist = _haversine_m(cur_lat, cur_lon, target_lat, target_lon)
        dalt = abs(last_alt - target_alt)

        if last_dist <= tolerance_m and dalt <= tolerance_alt_m:
            if stable_since is None:
                stable_since = time.time()
            elif time.time() - stable_since >= settle_time:
                print(f"Прибыли: dist={last_dist:.2f} м, alt={last_alt:.1f} м")
                return True
        else:
            stable_since = None

    print(f"Не прибыли за {timeout} с: dist={last_dist:.1f} м, "
          f"alt={last_alt:.1f} м")
    return False


def move_coords(master, router, lat, lng, target_alt=10.0,
                tolerance_m=1.5, tolerance_alt_m=1.0, timeout=120.0):
    master.mav.command_int_send(
        master.target_system,
        master.target_component,
        mavutil.mavlink.MAV_FRAME_GLOBAL_RELATIVE_ALT_INT,
        mavutil.mavlink.MAV_CMD_DO_REPOSITION,
        0, 0, -1, 0, 0, 0,
        int(lat * 1e7),
        int(lng * 1e7),
        target_alt)

    result = wait_command_ack(router, mavutil.mavlink.MAV_CMD_DO_REPOSITION)
    if result is None:
        print("Нет COMMAND_ACK для DO_REPOSITION")
        return False
    if result != mavutil.mavlink.MAV_RESULT_ACCEPTED:
        print(f"DO_REPOSITION отклонён, result={result}")
        return False

    print("DO_REPOSITION принят, летим...")
    return wait_arrival(router, lat, lng, target_alt,
                        tolerance_m=tolerance_m,
                        tolerance_alt_m=tolerance_alt_m,
                        timeout=timeout)


def goto_local_offset(master, router, north_m, east_m, up_m,
                      tolerance_m=0.5, timeout=60.0, rate_hz=5.0):
    """Летит в точку, смещённую от ТЕКУЩЕЙ позиции."""
    master.mav.request_data_stream_send(
        master.target_system, master.target_component,
        mavutil.mavlink.MAV_DATA_STREAM_POSITION, 10, 1)

    cur = wait_for_message(
        router,
        lambda m: m.get_type() == 'LOCAL_POSITION_NED',
        timeout=5.0)
    if cur is None:
        raise RuntimeError("Нет LOCAL_POSITION_NED — EKF ещё не готов")

    target_n = cur.x + north_m
    target_e = cur.y + east_m
    target_d = cur.z - up_m
    print(f"Цель: N={target_n:.2f}, E={target_e:.2f}, D={target_d:.2f} "
          f"(от текущей {cur.x:.2f}, {cur.y:.2f}, {cur.z:.2f})")

    type_mask = 0b0000111111111000
    start = time.time()
    last_send = 0.0
    period = 1.0 / rate_hz
    last_dist = None

    while True:
        if time.time() - last_send >= period:
            master.mav.set_position_target_local_ned_send(
                0,
                master.target_system, master.target_component,
                mavutil.mavlink.MAV_FRAME_LOCAL_NED,
                type_mask,
                target_n, target_e, target_d,
                0, 0, 0, 0, 0, 0, 0, 0)
            last_send = time.time()

        msg = wait_for_message(
            router,
            lambda m: m.get_type() == 'LOCAL_POSITION_NED',
            timeout=0.2)
        if msg is not None:
            dx = msg.x - target_n
            dy = msg.y - target_e
            dz = msg.z - target_d
            last_dist = (dx * dx + dy * dy + dz * dz) ** 0.5
            if last_dist <= tolerance_m:
                print(f"Прибыли: осталось {last_dist:.2f} м")
                return True

        time.sleep(0.05)

    raise TimeoutError(
        f"Не прибыли за {timeout} с (осталось {last_dist} м)")