import threading
import time

from pymavlink import mavutil


def wait_for_message(router, matcher, timeout=3.0):
    """Ждёт сообщение, для которого matcher(msg) == True.
    Возвращает сообщение или None. Не блокирует поток роутера."""
    ev = threading.Event()
    holder = {}

    def handler(msg):
        try:
            if matcher(msg):
                holder['msg'] = msg
                ev.set()
        except Exception:
            pass

    router.subscribe(handler)
    try:
        ev.wait(timeout)
    finally:
        router.unsubscribe(handler)
    return holder.get('msg')


def wait_command_ack(router, command, timeout=3.0):
    """Ждёт COMMAND_ACK для указанной команды. Возвращает result или None."""
    msg = wait_for_message(
        router,
        lambda m: m.get_type() == 'COMMAND_ACK' and m.command == command,
        timeout)
    return msg.result if msg is not None else None


def wait_mode(router, custom_mode, timeout=10.0):
    """Ждёт HEARTBEAT с нужным custom_mode. Возвращает True/False."""
    return wait_for_message(
        router,
        lambda m: (m.get_type() == 'HEARTBEAT'
                   and m.custom_mode == custom_mode),
        timeout) is not None


def wait_armed(router, armed, timeout=10.0):
    """Ждёт нужного состояния armed/disarmed. Возвращает True/False."""
    def match(m):
        if m.get_type() != 'HEARTBEAT':
            return False
        is_armed = bool(m.base_mode
                        & mavutil.mavlink.MAV_MODE_FLAG_SAFETY_ARMED)
        return is_armed == armed
    return wait_for_message(router, match, timeout) is not None


def wait_altitude(router, min_alt_m, timeout=30.0):
    """Ждёт, пока relative_alt >= min_alt_m. Возвращает высоту в метрах или None."""
    def match(m):
        if m.get_type() != 'GLOBAL_POSITION_INT':
            return False
        return m.relative_alt / 1000.0 >= min_alt_m
    msg = wait_for_message(router, match, timeout)
    return msg.relative_alt / 1000.0 if msg is not None else None


def send_gcs_heartbeat(master):
    """Отправляет HEARTBEAT от GCS. master — mavutil.mavfile."""
    master.mav.heartbeat_send(
        mavutil.mavlink.MAV_TYPE_GCS,
        mavutil.mavlink.MAV_AUTOPILOT_INVALID,
        0, 0, 0)


def apply_intervals(master, interval_us=1_000_000, msg_ids=None):
    """Задаёт интервалы для сообщений через SET_MESSAGE_INTERVAL.
    НЕ использует recv_match — только шлёт команды и коротко ждёт ACK
    через master.recv_match... нельзя: master теперь читается роутером.
    Поэтому ACK не ждём (или ждём через роутер, если он есть)."""
    if msg_ids is None:
        msg_ids = (
            mavutil.mavlink.MAVLINK_MSG_ID_GLOBAL_POSITION_INT,
            mavutil.mavlink.MAVLINK_MSG_ID_ATTITUDE,
            mavutil.mavlink.MAVLINK_MSG_ID_SYS_STATUS,
            mavutil.mavlink.MAVLINK_MSG_ID_GPS_RAW_INT,
            mavutil.mavlink.MAVLINK_MSG_ID_VFR_HUD,
            mavutil.mavlink.MAVLINK_MSG_ID_LOCAL_POSITION_NED,
            mavutil.mavlink.MAVLINK_MSG_ID_RAW_IMU,
            mavutil.mavlink.MAVLINK_MSG_ID_BATTERY_STATUS,
            mavutil.mavlink.MAVLINK_MSG_ID_MEMINFO,
            mavutil.mavlink.MAVLINK_MSG_ID_VIBRATION,
            mavutil.mavlink.MAVLINK_MSG_ID_SCALED_PRESSURE,
        )
    master.mav.request_data_stream_send(
        master.target_system, master.target_component,
        mavutil.mavlink.MAV_DATA_STREAM_ALL, 0, 0)
    for msg_id in msg_ids:
        master.mav.command_long_send(
            master.target_system, master.target_component,
            mavutil.mavlink.MAV_CMD_SET_MESSAGE_INTERVAL,
            0, msg_id, interval_us, 0, 0, 0, 0, 0)