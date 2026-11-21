from .utilities import wait_for_message


def get_gps(router, timeout=5.0):
    """Ждёт валидные координаты через роутер."""
    def valid(m):
        if m.get_type() == 'GPS_RAW_INT' and m.fix_type >= 3:
            return True
        if m.get_type() == 'GLOBAL_POSITION_INT' and m.lat != 0:
            return True
        return False
    while True:
        msg = wait_for_message(router, valid, timeout)
        if not msg is None:
        
            return msg.lat / 1e7, msg.lon / 1e7