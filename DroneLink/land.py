from pymavlink import mavutil
from .utilities import wait_mode, wait_armed


def rtl(master, router):
    master.mav.set_mode_send(
        master.target_system,
        mavutil.mavlink.MAV_MODE_FLAG_CUSTOM_MODE_ENABLED,
        6)
    if not wait_mode(router, 6):
        print("Не удалось переключиться в RTL")
        return False
    return True


def land(master, router, timeout=180.0):
    master.mav.command_long_send(
        master.target_system, master.target_component,
        mavutil.mavlink.MAV_CMD_NAV_LAND,
        0, 0, 0, 0, 0, 0, 0, 0)

    if not wait_armed(router, False, timeout=timeout):
        print(f"Не дизармировался за {timeout} с после LAND")
        return False
    return True