import math
import threading
import queue
import rospy
from DroneLink import *
from std_msgs.msg import Header, Bool, Float32
from sensor_msgs.msg import NavSatFix, NavSatStatus, Imu, BatteryState # type: ignore
from geometry_msgs.msg import Point, Vector3 # type: ignore
from drone_msgs.msg import DroneTelemetry # type: ignore
from geometry_msgs.msg import Twist # type: ignore

rospy.init_node("drone_controler")
tm = rospy.Publisher("/telemetry", DroneTelemetry, queue_size=10)

# ---------- ОЧЕРЕДЬ КОМАНД ----------

cmd_queue = queue.Queue()

abort_event = threading.Event()   # выставляется при аварийной остановке

def clear_queue():
    n = 0
    while True:
        try:
            cmd_queue.get_nowait()
            n += 1
        except queue.Empty:
            break
    if n:
        rospy.logwarn("Очередь очищена: удалено %d команд", n)

def _worker():
    while not rospy.is_shutdown():
        try:
            name, fn, args, kwargs = cmd_queue.get(timeout=0.5)
        except queue.Empty:
            continue

        # скипаем, если пока команда лежала в очереди — пришёл abort
        if abort_event.is_set():
            rospy.logwarn("[%s] skipped: abort", name)
            continue

        try:
            rospy.loginfo("[%s] start (в очереди ещё %d)", name, cmd_queue.qsize())
            result = fn(*args, **kwargs)
            if result is False:
                rospy.logerr("[%s] вернул False", name)
            else:
                rospy.loginfo("[%s] done (result=%r)", name, result)
        except Exception as e:
            rospy.logerr("[%s] failed: %s", name, e)

threading.Thread(target=_worker, daemon=True, name="cmd_worker").start()

def enqueue(name, fn, *args, **kwargs):
    rospy.loginfo("[%s] queued (перед: %d)", name, cmd_queue.qsize())
    cmd_queue.put((name, fn, args, kwargs))


def emergency_stop(msg):
    rospy.logerr(">>> EMERGENCY STOP (hard)")
    abort_event.set()
    clear_queue()
    if msg.data:
        

    # напрямую, не через очередь
        try:
            drone.rtl()          # или drone.land(), если хотите сесть на месте
        except Exception as e:
            rospy.logerr("RTL failed: %s", e)
        finally:
            abort_event.clear()
    else:
        try:
            drone.land()          # или drone.land(), если хотите сесть на месте
        except Exception as e:
            rospy.logerr("land failed: %s", e)
        finally:
            abort_event.clear()

def emergency_stop_parashut(msg):
    rospy.logerr(">>> EMERGENCY STOP (hard)")
    abort_event.set()
    clear_queue()
    try:
        drone.force_disarm()          # или drone.land(), если хотите сесть на месте
        drone.set_servo(5, 1900)
    except Exception as e:
        rospy.logerr("RTL/land failed: %s", e)
    finally:
        abort_event.clear()
# ---------- КОЛБЭКИ ROS → СТАВЯТ В ОЧЕРЕДЬ ----------

def goto_coords(msg):
    enqueue("goto_coords", drone.move_coords, msg.x, msg.y, msg.z)

def goto_local_offset(msg):
    enqueue("goto_local_offset", drone.goto_local_offset, msg.x, msg.y, msg.z)

def goto_speed(msg):
    data = msg.linear
    enqueue("goto_speed", drone.send_body_velocity, data.x, data.y, data.z, msg.angular.x)

def arm_disarm(msg):
    if msg.data:
        enqueue("arm",    drone.arm_motors)
    else:
        enqueue("disarm", drone.disarm_motors)

def take_off(msg):
    enqueue("take_off", drone.take_off, msg.data)

def land(msg):
    if msg.data:
        enqueue("rtl",  drone.rtl)
    else:
        enqueue("land", drone.land)


# ---------- ТЕЛЕМЕТРИЯ (без изменений) ----------

NAN = float("nan")

def euler_to_quat(roll, pitch, yaw):
    cy, sy = math.cos(yaw / 2),   math.sin(yaw / 2)
    cp, sp = math.cos(pitch / 2), math.sin(pitch / 2)
    cr, sr = math.cos(roll / 2),  math.sin(roll / 2)
    return (cr*cp*cy + sr*sp*sy,
            sr*cp*cy - cr*sp*sy,
            cr*sp*cy + sr*cp*sy,
            cr*cp*sy - sr*sp*cy)

def callback(t):
    m = DroneTelemetry()
    m.header = Header(stamp=rospy.Time.now(), frame_id="base_link")

    # --- Плоские поля ---
    m.armed              = bool(t["armed"])
    m.mode               = str(t["mode"])
    m.flight_mode        = str(t["flight_mode"])
    m.gps_fix_type       = int(t["gps_fix_type"])
    m.gps_satellites     = int(t["gps_satellites"])
    m.relative_altitude_m = float(t["relative_altitude_m"])
    m.heading_deg        = float(t["heading_deg"])
    m.current_consumed_mah = float(t["current_consumed_mah"])
    m.cpu_load_percent   = float(t["cpu_load_percent"])
    m.comm_drop_rate     = float(t["comm_drop_rate"])
    m.freemem_bytes      = float(t["freemem_bytes"])
    m.pressure_hpa       = float(t["pressure_hpa"])
    m.temperature_c      = float(t["temperature_c"])

    # --- GPS ---
    m.gps = NavSatFix()
    m.gps.header = m.header
    m.gps.status = NavSatStatus()
    m.gps.status.status = (NavSatStatus.STATUS_FIX
                           if m.gps_fix_type >= 2
                           else NavSatStatus.STATUS_NO_FIX)
    m.gps.status.service = NavSatStatus.SERVICE_GPS
    m.gps.latitude  = float(t["gps_lat"])
    m.gps.longitude = float(t["gps_lon"])
    m.gps.altitude  = float(t["gps_alt"])
    m.gps.position_covariance_type = NavSatFix.COVARIANCE_TYPE_UNKNOWN

    # --- Позиция и скорости в NED ---


    # --- IMU ---
    qx, qy, qz, qw = euler_to_quat(
        float(t["imu_roll"]), float(t["imu_pitch"]), float(t["imu_yaw"])
    )
    m.imu = Imu()
    m.imu.header = m.header
    m.imu.orientation.x = qx
    m.imu.orientation.y = qy
    m.imu.orientation.z = qz
    m.imu.orientation.w = qw
    m.imu.orientation_covariance[0] = 0.0
    m.imu.angular_velocity = Vector3(
        x=float(t["imu_gyro_x"]),
        y=float(t["imu_gyro_y"]),
        z=float(t["imu_gyro_z"]),
    )
    g = 9.80665 / 1000.0  # mg → м/с²
    m.imu.linear_acceleration = Vector3(
        x=float(t["imu_accel_x"]) * g,
        y=float(t["imu_accel_y"]) * g,
        z=float(t["imu_accel_z"]) * g,
    )

    # --- Батарея ---
    m.battery = BatteryState()
    m.battery.header    = m.header
    m.battery.voltage   = float(t["battery_voltage_v"])
    m.battery.current   = float(t["battery_current_a"])
    pct = float(t["battery_remaining_pct"])
    m.battery.percentage = pct / 100.0 if 0 <= pct <= 100 else NAN
    m.battery.charge     = NAN            # «остаток», а не «израсходовано»
    m.battery.present    = True
    bt = float(t["battery_temperature_c"])
    m.battery.temperature = bt if bt < 327 else NAN  # 327.67 — «нет данных»

    # --- Вибрации ---
    m.vibration = Vector3(
        x=float(t["vibration_x"]),
        y=float(t["vibration_y"]),
        z=float(t["vibration_z"]),
    )

    tm.publish(m)




# ---------- СТАРТ ----------

drone = DroneLink("tcp:172.19.112.1:5762")
drone.start_telemetry(callback, 20)
drone.gps()
rospy.Subscriber("/move/coords",      Point,   goto_coords, queue_size=10)
rospy.Subscriber("/drone/arm_disarm", Bool,    arm_disarm,  queue_size=10)
rospy.Subscriber("/drone/take_off",   Float32, take_off,    queue_size=10)
rospy.Subscriber("/drone/land",       Bool,    land,        queue_size=10)
rospy.Subscriber("/move/local_offest", Point, goto_local_offset, queue_size=10)
rospy.Subscriber("/move/speed", Twist, goto_speed, queue_size=10)
rospy.Subscriber("/drone/emergency_stop/land", Bool, emergency_stop)
rospy.Subscriber("/drone/emergency_stop/stop_flight", Bool, emergency_stop_parashut)
gps = rospy.Publisher("/drone/gps", Point, queue_size=10)
r = rospy.Rate(10)
while not rospy.is_shutdown():
    m = Point()
    gp = drone.gps()
    m.x = gp[0]
    m.y = gp[1]
    gps.publish(m)
    r.sleep()