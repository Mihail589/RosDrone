import time
from pymavlink import mavutil

# --- Настройки ---
CONNECTION       = 'tcp:127.0.0.1:5762'
ACK_TIMEOUT      = 5.0
HEARTBEAT_TIMEOUT = 10.0
ALTITUDE_TIMEOUT = 30.0


# ============ Вспомогательные функции ============

def wait_command_ack(master, command_id, timeout=ACK_TIMEOUT):
    """Ждёт COMMAND_ACK для указанной команды. Возвращает result или None."""
    deadline = time.time() + timeout
    while time.time() < deadline:
        msg = master.recv_match(type='COMMAND_ACK', blocking=True,
                                timeout=deadline - time.time())
        if msg is None:
            break
        if msg.command == command_id:
            return msg.result
    return None


def wait_mode(master, custom_mode, timeout=HEARTBEAT_TIMEOUT):
    """Ждёт HEARTBEAT с нужным custom_mode. Возвращает True/False."""
    deadline = time.time() + timeout
    while time.time() < deadline:
        msg = master.recv_match(type='HEARTBEAT', blocking=True,
                                timeout=deadline - time.time())
        if msg is None:
            break
        if msg.custom_mode == custom_mode:
            return True
    return False


def wait_armed(master, armed, timeout=HEARTBEAT_TIMEOUT):
    """Ждёт нужного состояния armed/disarmed. Возвращает True/False."""
    deadline = time.time() + timeout
    while time.time() < deadline:
        msg = master.recv_match(type='HEARTBEAT', blocking=True,
                                timeout=deadline - time.time())
        if msg is None:
            break
        is_armed = bool(msg.base_mode & mavutil.mavlink.MAV_MODE_FLAG_SAFETY_ARMED)
        if is_armed == armed:
            return True
    return False


def wait_altitude(master, min_alt_m, timeout=ALTITUDE_TIMEOUT):
    """Ждёт, пока relative_alt >= min_alt_m. Возвращает высоту в метрах или None."""
    deadline = time.time() + timeout
    while time.time() < deadline:
        msg = master.recv_match(type='GLOBAL_POSITION_INT', blocking=True,
                                timeout=deadline - time.time())
        if msg is None:
            break
        alt_m = msg.relative_alt / 1000.0
        if alt_m >= min_alt_m:
            return alt_m
    return None


# ============ 1. Подключение ============
master = mavutil.mavlink_connection(CONNECTION)
master.wait_heartbeat()
print(f"Heartbeat from system ({master.target_system}, {master.target_component})")


# ============ 2. Поток данных и ожидание GPS ============
master.mav.request_data_stream_send(
    master.target_system, master.target_component,
    mavutil.mavlink.MAV_DATA_STREAM_POSITION, 4, 1)

print("Ожидание GPS 3D fix...")
while True:
    msg = master.recv_match(type=['GPS_RAW_INT', 'GLOBAL_POSITION_INT'],
                            blocking=True, timeout=5)
    if msg is None:
        continue
    if msg.get_type() == 'GPS_RAW_INT' and msg.fix_type >= 3:
        print(f"GPS fix: {msg.fix_type}")
        break
    if msg.get_type() == 'GLOBAL_POSITION_INT' and msg.lat != 0:
        print(f"Координаты валидны: Lat={msg.lat/1e7}, Lon={msg.lon/1e7}")
        break

lat = msg.lat / 1e7
lon = msg.lon / 1e7


# ============ 3. Режим GUIDED ============
print("Переключение в GUIDED...")
master.mav.set_mode_send(
    master.target_system,
    mavutil.mavlink.MAV_MODE_FLAG_CUSTOM_MODE_ENABLED,
    4)
if not wait_mode(master, 4):
    raise RuntimeError("Не удалось переключиться в GUIDED (нет HEARTBEAT с custom_mode=4)")
print("GUIDED подтверждён.")


# ============ 4. Арминг ============
print("Arming motors...")
master.mav.command_long_send(
    master.target_system, master.target_component,
    mavutil.mavlink.MAV_CMD_COMPONENT_ARM_DISARM,
    0, 1, 0, 0, 0, 0, 0, 0)

result = wait_command_ack(master, mavutil.mavlink.MAV_CMD_COMPONENT_ARM_DISARM)
if result is None:
    raise RuntimeError("Нет COMMAND_ACK для ARM")
if result != mavutil.mavlink.MAV_RESULT_ACCEPTED:
    raise RuntimeError(f"ARM отклонён, result={result}")

if not wait_armed(master, True):
    raise RuntimeError("ARM не подтверждён по HEARTBEAT")
print("Armed!")


# ============ 5. Взлёт ============
print("Taking off...")
master.mav.command_long_send(
    master.target_system, master.target_component,
    mavutil.mavlink.MAV_CMD_NAV_TAKEOFF,
    0, 0, 0, 0, 0, 0, 0, 10.0)

result = wait_command_ack(master, mavutil.mavlink.MAV_CMD_NAV_TAKEOFF)
if result is None:
    raise RuntimeError("Нет COMMAND_ACK для TAKEOFF")
if result != mavutil.mavlink.MAV_RESULT_ACCEPTED:
    raise RuntimeError(f"TAKEOFF отклонён, result={result}")

alt = wait_altitude(master, 5.0)
if alt is None:
    raise RuntimeError("Не набрали 5 метров за отведённое время")
print(f"Дрон на высоте {alt:.1f} м")


# ============ 6. Перемещение в точку (DO_REPOSITION) ============
print("Перемещение в заданные координаты...")
target_lat = lat + 0.0006
target_lon = lon + 0.0006
target_alt = 20.0

master.mav.command_int_send(
    master.target_system,
    master.target_component,
    mavutil.mavlink.MAV_FRAME_GLOBAL_RELATIVE_ALT_INT,
    mavutil.mavlink.MAV_CMD_DO_REPOSITION,
    0, 0, -1, 0, 0, 0,
    int(target_lat * 1e7),
    int(target_lon * 1e7),
    target_alt)

result = wait_command_ack(master, mavutil.mavlink.MAV_CMD_DO_REPOSITION)
if result is None:
    raise RuntimeError("Нет COMMAND_ACK для DO_REPOSITION")
if result != mavutil.mavlink.MAV_RESULT_ACCEPTED:
    raise RuntimeError(f"DO_REPOSITION отклонён, result={result}")
print("DO_REPOSITION принят, летим...")
time.sleep(15)


# ============ 7. Локальное смещение ============
def goto_local_offset(master, north_m, east_m, up_m, duration=10):
    """Смещение относительно дома в MAV_FRAME_LOCAL_NED. Z направлена вниз."""
    type_mask = 0b0000111111111000
    z_down = -up_m
    msg = master.mav.set_position_target_local_ned_encode(
        0, 0, 0,
        mavutil.mavlink.MAV_FRAME_LOCAL_OFFSET_NED ,
        type_mask,
        north_m, east_m, z_down,
        0, 0, 0, 0, 0, 0, 0, 0)
    print(f"Летим: N={north_m} м, E={east_m} м, вверх={up_m} м")
    start = time.time()
    while time.time() - start < duration:
        master.mav.send(msg)
        time.sleep(1)

goto_local_offset(master, 30, 0, 10)
time.sleep(5)


# ============ 8. Движение вперёд ============
def send_body_velocity(master, vx, vy, vz, duration):
    """Скорость в MAV_FRAME_BODY_OFFSET_NED. vx=вперёд, vz=вниз."""
    type_mask = 0b0000111111000111
    msg = master.mav.set_position_target_local_ned_encode(
        0, 0, 0,
        mavutil.mavlink.MAV_FRAME_BODY_OFFSET_NED,
        type_mask,
        0, 0, 0,
        vx, vy, vz,
        0, 0, 0, 0, 0)
    print(f"Движение: Vx={vx}, Vy={vy}, Vz={vz} в течение {duration} сек.")
    start = time.time()
    while time.time() - start < duration:
        master.mav.send(msg)
        time.sleep(1)

send_body_velocity(master, vx=15, vy=0, vz=0, duration=10)


# ============ 9. RTL ============
print("Переключение в RTL...")
master.mav.set_mode_send(
    master.target_system,
    mavutil.mavlink.MAV_MODE_FLAG_CUSTOM_MODE_ENABLED,
    6)
if not wait_mode(master, 6):
    raise RuntimeError("Не удалось переключиться в RTL")
print("RTL подтверждён.")


# ============ 10. Ожидание дизарминга ============
print("Ожидание посадки и дизарминга...")
if not wait_armed(master, False, timeout=180):
    raise RuntimeError("Дрон не дизармился за 180 секунд")
print("Disarmed. Миссия завершена.")