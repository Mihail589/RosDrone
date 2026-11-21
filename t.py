import rospy
from drone_msgs.msg import DroneTelemetry # type: ignore

rospy.init_node("telemetry")
def callback(msg):
    print(msg)

rospy.Subscriber("/telemetry", DroneTelemetry, callback)
rospy.spin()