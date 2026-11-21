from pymavlink import mavutil
import time

def set_servo_pwm(master: mavutil.mavfile, servo_channel, pwm_value):
    """
    Устанавливает ШИМ для указанного канала сервопривода.
    :param master: объект соединения pymavlink
    :param servo_channel: номер канала (например, 9 для AUX1)
    :param pwm_value: значение ШИМ в микросекундах (обычно 1000-2000)
    """
    master.mav.command_long_send(
        master.target_system,
        master.target_component,
        mavutil.mavlink.MAV_CMD_DO_SET_SERVO,
        0,              # confirmation
        servo_channel,  # param1: номер сервопривода (канал)
        pwm_value,      # param2: значение ШИМ
        0, 0, 0, 0, 0   # param3-7: не используются
    )
    # Рекомендуется дождаться подтверждения
    ack = master.recv_match(type='COMMAND_ACK', blocking=True, timeout=2)
    if ack and ack.command == mavutil.mavlink.MAV_CMD_DO_SET_SERVO:
        return True