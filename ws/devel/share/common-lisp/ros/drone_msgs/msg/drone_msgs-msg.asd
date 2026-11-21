
(cl:in-package :asdf)

(defsystem "drone_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :sensor_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "DroneTelemetry" :depends-on ("_package_DroneTelemetry"))
    (:file "_package_DroneTelemetry" :depends-on ("_package"))
  ))