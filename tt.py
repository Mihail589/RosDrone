import rospy, time
from std_msgs.msg import Bool, Float32
from geometry_msgs.msg import Point, Twist, Vector3 # type: ignore

rospy.init_node("send_coord")

arm      = rospy.Publisher("/drone/arm_disarm", Bool,    queue_size=10)
take_off = rospy.Publisher("/drone/take_off",   Float32, queue_size=10)
land     = rospy.Publisher("/drone/land",       Bool,    queue_size=10)
coords   = rospy.Publisher("/move/coords",      Point,   queue_size=10)
local_offset = rospy.Publisher("/move/local_offest", Point, queue_size=10)
speed = rospy.Publisher("/move/speed", Twist, queue_size=10)

# дать издателям установить TCP-соединение с /drone_controler
rospy.sleep(1.0)

# дождаться первого GPS-фикса (вместо busy-wait)
g = rospy.wait_for_message("/drone/gps", Point)
rospy.loginfo(f"GPS: {g.x:.7f}, {g.y:.7f}")

target_lat = g.x + 0.0006
target_lon = g.y + 0.0006

# все команды идут в очередь и выполняются по одной
arm.publish(Bool(data=True))
time.sleep(1)
take_off.publish(Float32(data=15.0))
time.sleep(1)
coords.publish(Point(x=target_lat, y=target_lon, z=15.0))
time.sleep(1)
local_offset.publish(Point(x=1000, y = 10))
time.sleep(1)
speed.publish(Twist(linear=Vector3(x=10, y=10, z=0), angular=Vector3(x=60)))
time.sleep(1)
land.publish(Bool(data=True))   # RTL