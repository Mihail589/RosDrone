; Auto-generated. Do not edit!


(cl:in-package drone_msgs-msg)


;//! \htmlinclude DroneTelemetry.msg.html

(cl:defclass <DroneTelemetry> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (armed
    :reader armed
    :initarg :armed
    :type cl:boolean
    :initform cl:nil)
   (mode
    :reader mode
    :initarg :mode
    :type cl:string
    :initform "")
   (flight_mode
    :reader flight_mode
    :initarg :flight_mode
    :type cl:string
    :initform "")
   (gps
    :reader gps
    :initarg :gps
    :type sensor_msgs-msg:NavSatFix
    :initform (cl:make-instance 'sensor_msgs-msg:NavSatFix))
   (gps_fix_type
    :reader gps_fix_type
    :initarg :gps_fix_type
    :type cl:fixnum
    :initform 0)
   (gps_satellites
    :reader gps_satellites
    :initarg :gps_satellites
    :type cl:fixnum
    :initform 0)
   (position_ned
    :reader position_ned
    :initarg :position_ned
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point))
   (velocity_ned
    :reader velocity_ned
    :initarg :velocity_ned
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3))
   (relative_altitude_m
    :reader relative_altitude_m
    :initarg :relative_altitude_m
    :type cl:float
    :initform 0.0)
   (heading_deg
    :reader heading_deg
    :initarg :heading_deg
    :type cl:float
    :initform 0.0)
   (imu
    :reader imu
    :initarg :imu
    :type sensor_msgs-msg:Imu
    :initform (cl:make-instance 'sensor_msgs-msg:Imu))
   (battery
    :reader battery
    :initarg :battery
    :type sensor_msgs-msg:BatteryState
    :initform (cl:make-instance 'sensor_msgs-msg:BatteryState))
   (current_consumed_mah
    :reader current_consumed_mah
    :initarg :current_consumed_mah
    :type cl:float
    :initform 0.0)
   (cpu_load_percent
    :reader cpu_load_percent
    :initarg :cpu_load_percent
    :type cl:float
    :initform 0.0)
   (comm_drop_rate
    :reader comm_drop_rate
    :initarg :comm_drop_rate
    :type cl:float
    :initform 0.0)
   (freemem_bytes
    :reader freemem_bytes
    :initarg :freemem_bytes
    :type cl:float
    :initform 0.0)
   (vibration
    :reader vibration
    :initarg :vibration
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3))
   (pressure_hpa
    :reader pressure_hpa
    :initarg :pressure_hpa
    :type cl:float
    :initform 0.0)
   (temperature_c
    :reader temperature_c
    :initarg :temperature_c
    :type cl:float
    :initform 0.0))
)

(cl:defclass DroneTelemetry (<DroneTelemetry>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DroneTelemetry>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DroneTelemetry)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name drone_msgs-msg:<DroneTelemetry> is deprecated: use drone_msgs-msg:DroneTelemetry instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <DroneTelemetry>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader drone_msgs-msg:header-val is deprecated.  Use drone_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'armed-val :lambda-list '(m))
(cl:defmethod armed-val ((m <DroneTelemetry>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader drone_msgs-msg:armed-val is deprecated.  Use drone_msgs-msg:armed instead.")
  (armed m))

(cl:ensure-generic-function 'mode-val :lambda-list '(m))
(cl:defmethod mode-val ((m <DroneTelemetry>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader drone_msgs-msg:mode-val is deprecated.  Use drone_msgs-msg:mode instead.")
  (mode m))

(cl:ensure-generic-function 'flight_mode-val :lambda-list '(m))
(cl:defmethod flight_mode-val ((m <DroneTelemetry>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader drone_msgs-msg:flight_mode-val is deprecated.  Use drone_msgs-msg:flight_mode instead.")
  (flight_mode m))

(cl:ensure-generic-function 'gps-val :lambda-list '(m))
(cl:defmethod gps-val ((m <DroneTelemetry>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader drone_msgs-msg:gps-val is deprecated.  Use drone_msgs-msg:gps instead.")
  (gps m))

(cl:ensure-generic-function 'gps_fix_type-val :lambda-list '(m))
(cl:defmethod gps_fix_type-val ((m <DroneTelemetry>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader drone_msgs-msg:gps_fix_type-val is deprecated.  Use drone_msgs-msg:gps_fix_type instead.")
  (gps_fix_type m))

(cl:ensure-generic-function 'gps_satellites-val :lambda-list '(m))
(cl:defmethod gps_satellites-val ((m <DroneTelemetry>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader drone_msgs-msg:gps_satellites-val is deprecated.  Use drone_msgs-msg:gps_satellites instead.")
  (gps_satellites m))

(cl:ensure-generic-function 'position_ned-val :lambda-list '(m))
(cl:defmethod position_ned-val ((m <DroneTelemetry>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader drone_msgs-msg:position_ned-val is deprecated.  Use drone_msgs-msg:position_ned instead.")
  (position_ned m))

(cl:ensure-generic-function 'velocity_ned-val :lambda-list '(m))
(cl:defmethod velocity_ned-val ((m <DroneTelemetry>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader drone_msgs-msg:velocity_ned-val is deprecated.  Use drone_msgs-msg:velocity_ned instead.")
  (velocity_ned m))

(cl:ensure-generic-function 'relative_altitude_m-val :lambda-list '(m))
(cl:defmethod relative_altitude_m-val ((m <DroneTelemetry>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader drone_msgs-msg:relative_altitude_m-val is deprecated.  Use drone_msgs-msg:relative_altitude_m instead.")
  (relative_altitude_m m))

(cl:ensure-generic-function 'heading_deg-val :lambda-list '(m))
(cl:defmethod heading_deg-val ((m <DroneTelemetry>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader drone_msgs-msg:heading_deg-val is deprecated.  Use drone_msgs-msg:heading_deg instead.")
  (heading_deg m))

(cl:ensure-generic-function 'imu-val :lambda-list '(m))
(cl:defmethod imu-val ((m <DroneTelemetry>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader drone_msgs-msg:imu-val is deprecated.  Use drone_msgs-msg:imu instead.")
  (imu m))

(cl:ensure-generic-function 'battery-val :lambda-list '(m))
(cl:defmethod battery-val ((m <DroneTelemetry>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader drone_msgs-msg:battery-val is deprecated.  Use drone_msgs-msg:battery instead.")
  (battery m))

(cl:ensure-generic-function 'current_consumed_mah-val :lambda-list '(m))
(cl:defmethod current_consumed_mah-val ((m <DroneTelemetry>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader drone_msgs-msg:current_consumed_mah-val is deprecated.  Use drone_msgs-msg:current_consumed_mah instead.")
  (current_consumed_mah m))

(cl:ensure-generic-function 'cpu_load_percent-val :lambda-list '(m))
(cl:defmethod cpu_load_percent-val ((m <DroneTelemetry>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader drone_msgs-msg:cpu_load_percent-val is deprecated.  Use drone_msgs-msg:cpu_load_percent instead.")
  (cpu_load_percent m))

(cl:ensure-generic-function 'comm_drop_rate-val :lambda-list '(m))
(cl:defmethod comm_drop_rate-val ((m <DroneTelemetry>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader drone_msgs-msg:comm_drop_rate-val is deprecated.  Use drone_msgs-msg:comm_drop_rate instead.")
  (comm_drop_rate m))

(cl:ensure-generic-function 'freemem_bytes-val :lambda-list '(m))
(cl:defmethod freemem_bytes-val ((m <DroneTelemetry>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader drone_msgs-msg:freemem_bytes-val is deprecated.  Use drone_msgs-msg:freemem_bytes instead.")
  (freemem_bytes m))

(cl:ensure-generic-function 'vibration-val :lambda-list '(m))
(cl:defmethod vibration-val ((m <DroneTelemetry>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader drone_msgs-msg:vibration-val is deprecated.  Use drone_msgs-msg:vibration instead.")
  (vibration m))

(cl:ensure-generic-function 'pressure_hpa-val :lambda-list '(m))
(cl:defmethod pressure_hpa-val ((m <DroneTelemetry>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader drone_msgs-msg:pressure_hpa-val is deprecated.  Use drone_msgs-msg:pressure_hpa instead.")
  (pressure_hpa m))

(cl:ensure-generic-function 'temperature_c-val :lambda-list '(m))
(cl:defmethod temperature_c-val ((m <DroneTelemetry>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader drone_msgs-msg:temperature_c-val is deprecated.  Use drone_msgs-msg:temperature_c instead.")
  (temperature_c m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DroneTelemetry>) ostream)
  "Serializes a message object of type '<DroneTelemetry>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'armed) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'mode))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'mode))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'flight_mode))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'flight_mode))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'gps) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'gps_fix_type)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'gps_satellites)) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'position_ned) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'velocity_ned) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'relative_altitude_m))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'heading_deg))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'imu) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'battery) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'current_consumed_mah))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'cpu_load_percent))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'comm_drop_rate))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'freemem_bytes))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'vibration) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'pressure_hpa))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'temperature_c))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DroneTelemetry>) istream)
  "Deserializes a message object of type '<DroneTelemetry>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:slot-value msg 'armed) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'mode) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'mode) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'flight_mode) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'flight_mode) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'gps) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'gps_fix_type)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'gps_satellites)) (cl:read-byte istream))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'position_ned) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'velocity_ned) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'relative_altitude_m) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'heading_deg) (roslisp-utils:decode-single-float-bits bits)))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'imu) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'battery) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'current_consumed_mah) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'cpu_load_percent) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'comm_drop_rate) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'freemem_bytes) (roslisp-utils:decode-single-float-bits bits)))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'vibration) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pressure_hpa) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'temperature_c) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DroneTelemetry>)))
  "Returns string type for a message object of type '<DroneTelemetry>"
  "drone_msgs/DroneTelemetry")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DroneTelemetry)))
  "Returns string type for a message object of type 'DroneTelemetry"
  "drone_msgs/DroneTelemetry")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DroneTelemetry>)))
  "Returns md5sum for a message object of type '<DroneTelemetry>"
  "a1270bfbdee5c98ac6beb53ce8f27ba9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DroneTelemetry)))
  "Returns md5sum for a message object of type 'DroneTelemetry"
  "a1270bfbdee5c98ac6beb53ce8f27ba9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DroneTelemetry>)))
  "Returns full string definition for message of type '<DroneTelemetry>"
  (cl:format cl:nil "# DroneTelemetry.msg — единый снимок телеметрии~%std_msgs/Header header~%~%# --- Состояние полёта ---~%bool   armed~%string mode              # PX4/ArduPilot mode, напр. \"STABILIZE\", \"OFFBOARD\"~%string flight_mode       # MAVSDK FlightMode enum как строка~%~%# --- GPS / глобальная позиция ---~%sensor_msgs/NavSatFix gps~%uint8  gps_fix_type      # 0=no fix, 2=2D, 3=3D~%uint8  gps_satellites~%~%# --- Локальная позиция и скорость (NED) ---~%geometry_msgs/Point    position_ned     # x=north, y=east, z=down, м~%geometry_msgs/Vector3  velocity_ned     # м/с~%float32 relative_altitude_m~%float32 heading_deg~%~%# --- Ориентация и угловые скорости ---~%sensor_msgs/Imu imu~%~%# --- Батарея ---~%sensor_msgs/BatteryState battery~%float32 current_consumed_mah   # NaN, если не поддерживается~%~%# --- Система ---~%float32 cpu_load_percent       # SYS_STATUS.load / 10~%float32 comm_drop_rate         # SYS_STATUS.drop_rate_comm / 100~%float32 freemem_bytes          # MEMINFO.freemem~%~%# --- Вибрации (м/с²) ---~%geometry_msgs/Vector3 vibration~%~%# --- Барометр ---~%float32 pressure_hpa           # SCALED_PRESSURE.press_abs~%float32 temperature_c~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: sensor_msgs/NavSatFix~%# Navigation Satellite fix for any Global Navigation Satellite System~%#~%# Specified using the WGS 84 reference ellipsoid~%~%# header.stamp specifies the ROS time for this measurement (the~%#        corresponding satellite time may be reported using the~%#        sensor_msgs/TimeReference message).~%#~%# header.frame_id is the frame of reference reported by the satellite~%#        receiver, usually the location of the antenna.  This is a~%#        Euclidean frame relative to the vehicle, not a reference~%#        ellipsoid.~%Header header~%~%# satellite fix status information~%NavSatStatus status~%~%# Latitude [degrees]. Positive is north of equator; negative is south.~%float64 latitude~%~%# Longitude [degrees]. Positive is east of prime meridian; negative is west.~%float64 longitude~%~%# Altitude [m]. Positive is above the WGS 84 ellipsoid~%# (quiet NaN if no altitude is available).~%float64 altitude~%~%# Position covariance [m^2] defined relative to a tangential plane~%# through the reported position. The components are East, North, and~%# Up (ENU), in row-major order.~%#~%# Beware: this coordinate system exhibits singularities at the poles.~%~%float64[9] position_covariance~%~%# If the covariance of the fix is known, fill it in completely. If the~%# GPS receiver provides the variance of each measurement, put them~%# along the diagonal. If only Dilution of Precision is available,~%# estimate an approximate covariance from that.~%~%uint8 COVARIANCE_TYPE_UNKNOWN = 0~%uint8 COVARIANCE_TYPE_APPROXIMATED = 1~%uint8 COVARIANCE_TYPE_DIAGONAL_KNOWN = 2~%uint8 COVARIANCE_TYPE_KNOWN = 3~%~%uint8 position_covariance_type~%~%================================================================================~%MSG: sensor_msgs/NavSatStatus~%# Navigation Satellite fix status for any Global Navigation Satellite System~%~%# Whether to output an augmented fix is determined by both the fix~%# type and the last time differential corrections were received.  A~%# fix is valid when status >= STATUS_FIX.~%~%int8 STATUS_NO_FIX =  -1        # unable to fix position~%int8 STATUS_FIX =      0        # unaugmented fix~%int8 STATUS_SBAS_FIX = 1        # with satellite-based augmentation~%int8 STATUS_GBAS_FIX = 2        # with ground-based augmentation~%~%int8 status~%~%# Bits defining which Global Navigation Satellite System signals were~%# used by the receiver.~%~%uint16 SERVICE_GPS =     1~%uint16 SERVICE_GLONASS = 2~%uint16 SERVICE_COMPASS = 4      # includes BeiDou.~%uint16 SERVICE_GALILEO = 8~%~%uint16 service~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: sensor_msgs/Imu~%# This is a message to hold data from an IMU (Inertial Measurement Unit)~%#~%# Accelerations should be in m/s^2 (not in g's), and rotational velocity should be in rad/sec~%#~%# If the covariance of the measurement is known, it should be filled in (if all you know is the ~%# variance of each measurement, e.g. from the datasheet, just put those along the diagonal)~%# A covariance matrix of all zeros will be interpreted as \"covariance unknown\", and to use the~%# data a covariance will have to be assumed or gotten from some other source~%#~%# If you have no estimate for one of the data elements (e.g. your IMU doesn't produce an orientation ~%# estimate), please set element 0 of the associated covariance matrix to -1~%# If you are interpreting this message, please check for a value of -1 in the first element of each ~%# covariance matrix, and disregard the associated estimate.~%~%Header header~%~%geometry_msgs/Quaternion orientation~%float64[9] orientation_covariance # Row major about x, y, z axes~%~%geometry_msgs/Vector3 angular_velocity~%float64[9] angular_velocity_covariance # Row major about x, y, z axes~%~%geometry_msgs/Vector3 linear_acceleration~%float64[9] linear_acceleration_covariance # Row major x, y z ~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: sensor_msgs/BatteryState~%~%# Constants are chosen to match the enums in the linux kernel~%# defined in include/linux/power_supply.h as of version 3.7~%# The one difference is for style reasons the constants are~%# all uppercase not mixed case.~%~%# Power supply status constants~%uint8 POWER_SUPPLY_STATUS_UNKNOWN = 0~%uint8 POWER_SUPPLY_STATUS_CHARGING = 1~%uint8 POWER_SUPPLY_STATUS_DISCHARGING = 2~%uint8 POWER_SUPPLY_STATUS_NOT_CHARGING = 3~%uint8 POWER_SUPPLY_STATUS_FULL = 4~%~%# Power supply health constants~%uint8 POWER_SUPPLY_HEALTH_UNKNOWN = 0~%uint8 POWER_SUPPLY_HEALTH_GOOD = 1~%uint8 POWER_SUPPLY_HEALTH_OVERHEAT = 2~%uint8 POWER_SUPPLY_HEALTH_DEAD = 3~%uint8 POWER_SUPPLY_HEALTH_OVERVOLTAGE = 4~%uint8 POWER_SUPPLY_HEALTH_UNSPEC_FAILURE = 5~%uint8 POWER_SUPPLY_HEALTH_COLD = 6~%uint8 POWER_SUPPLY_HEALTH_WATCHDOG_TIMER_EXPIRE = 7~%uint8 POWER_SUPPLY_HEALTH_SAFETY_TIMER_EXPIRE = 8~%~%# Power supply technology (chemistry) constants~%uint8 POWER_SUPPLY_TECHNOLOGY_UNKNOWN = 0~%uint8 POWER_SUPPLY_TECHNOLOGY_NIMH = 1~%uint8 POWER_SUPPLY_TECHNOLOGY_LION = 2~%uint8 POWER_SUPPLY_TECHNOLOGY_LIPO = 3~%uint8 POWER_SUPPLY_TECHNOLOGY_LIFE = 4~%uint8 POWER_SUPPLY_TECHNOLOGY_NICD = 5~%uint8 POWER_SUPPLY_TECHNOLOGY_LIMN = 6~%~%Header  header~%float32 voltage          # Voltage in Volts (Mandatory)~%float32 temperature      # Temperature in Degrees Celsius (If unmeasured NaN)~%float32 current          # Negative when discharging (A)  (If unmeasured NaN)~%float32 charge           # Current charge in Ah  (If unmeasured NaN)~%float32 capacity         # Capacity in Ah (last full capacity)  (If unmeasured NaN)~%float32 design_capacity  # Capacity in Ah (design capacity)  (If unmeasured NaN)~%float32 percentage       # Charge percentage on 0 to 1 range  (If unmeasured NaN)~%uint8   power_supply_status     # The charging status as reported. Values defined above~%uint8   power_supply_health     # The battery health metric. Values defined above~%uint8   power_supply_technology # The battery chemistry. Values defined above~%bool    present          # True if the battery is present~%~%float32[] cell_voltage   # An array of individual cell voltages for each cell in the pack~%                         # If individual voltages unknown but number of cells known set each to NaN~%float32[] cell_temperature  # An array of individual cell temperatures for each cell in the pack~%                            # If individual temperatures unknown but number of cells known set each to NaN~%string location          # The location into which the battery is inserted. (slot number or plug)~%string serial_number     # The best approximation of the battery serial number~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DroneTelemetry)))
  "Returns full string definition for message of type 'DroneTelemetry"
  (cl:format cl:nil "# DroneTelemetry.msg — единый снимок телеметрии~%std_msgs/Header header~%~%# --- Состояние полёта ---~%bool   armed~%string mode              # PX4/ArduPilot mode, напр. \"STABILIZE\", \"OFFBOARD\"~%string flight_mode       # MAVSDK FlightMode enum как строка~%~%# --- GPS / глобальная позиция ---~%sensor_msgs/NavSatFix gps~%uint8  gps_fix_type      # 0=no fix, 2=2D, 3=3D~%uint8  gps_satellites~%~%# --- Локальная позиция и скорость (NED) ---~%geometry_msgs/Point    position_ned     # x=north, y=east, z=down, м~%geometry_msgs/Vector3  velocity_ned     # м/с~%float32 relative_altitude_m~%float32 heading_deg~%~%# --- Ориентация и угловые скорости ---~%sensor_msgs/Imu imu~%~%# --- Батарея ---~%sensor_msgs/BatteryState battery~%float32 current_consumed_mah   # NaN, если не поддерживается~%~%# --- Система ---~%float32 cpu_load_percent       # SYS_STATUS.load / 10~%float32 comm_drop_rate         # SYS_STATUS.drop_rate_comm / 100~%float32 freemem_bytes          # MEMINFO.freemem~%~%# --- Вибрации (м/с²) ---~%geometry_msgs/Vector3 vibration~%~%# --- Барометр ---~%float32 pressure_hpa           # SCALED_PRESSURE.press_abs~%float32 temperature_c~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: sensor_msgs/NavSatFix~%# Navigation Satellite fix for any Global Navigation Satellite System~%#~%# Specified using the WGS 84 reference ellipsoid~%~%# header.stamp specifies the ROS time for this measurement (the~%#        corresponding satellite time may be reported using the~%#        sensor_msgs/TimeReference message).~%#~%# header.frame_id is the frame of reference reported by the satellite~%#        receiver, usually the location of the antenna.  This is a~%#        Euclidean frame relative to the vehicle, not a reference~%#        ellipsoid.~%Header header~%~%# satellite fix status information~%NavSatStatus status~%~%# Latitude [degrees]. Positive is north of equator; negative is south.~%float64 latitude~%~%# Longitude [degrees]. Positive is east of prime meridian; negative is west.~%float64 longitude~%~%# Altitude [m]. Positive is above the WGS 84 ellipsoid~%# (quiet NaN if no altitude is available).~%float64 altitude~%~%# Position covariance [m^2] defined relative to a tangential plane~%# through the reported position. The components are East, North, and~%# Up (ENU), in row-major order.~%#~%# Beware: this coordinate system exhibits singularities at the poles.~%~%float64[9] position_covariance~%~%# If the covariance of the fix is known, fill it in completely. If the~%# GPS receiver provides the variance of each measurement, put them~%# along the diagonal. If only Dilution of Precision is available,~%# estimate an approximate covariance from that.~%~%uint8 COVARIANCE_TYPE_UNKNOWN = 0~%uint8 COVARIANCE_TYPE_APPROXIMATED = 1~%uint8 COVARIANCE_TYPE_DIAGONAL_KNOWN = 2~%uint8 COVARIANCE_TYPE_KNOWN = 3~%~%uint8 position_covariance_type~%~%================================================================================~%MSG: sensor_msgs/NavSatStatus~%# Navigation Satellite fix status for any Global Navigation Satellite System~%~%# Whether to output an augmented fix is determined by both the fix~%# type and the last time differential corrections were received.  A~%# fix is valid when status >= STATUS_FIX.~%~%int8 STATUS_NO_FIX =  -1        # unable to fix position~%int8 STATUS_FIX =      0        # unaugmented fix~%int8 STATUS_SBAS_FIX = 1        # with satellite-based augmentation~%int8 STATUS_GBAS_FIX = 2        # with ground-based augmentation~%~%int8 status~%~%# Bits defining which Global Navigation Satellite System signals were~%# used by the receiver.~%~%uint16 SERVICE_GPS =     1~%uint16 SERVICE_GLONASS = 2~%uint16 SERVICE_COMPASS = 4      # includes BeiDou.~%uint16 SERVICE_GALILEO = 8~%~%uint16 service~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: sensor_msgs/Imu~%# This is a message to hold data from an IMU (Inertial Measurement Unit)~%#~%# Accelerations should be in m/s^2 (not in g's), and rotational velocity should be in rad/sec~%#~%# If the covariance of the measurement is known, it should be filled in (if all you know is the ~%# variance of each measurement, e.g. from the datasheet, just put those along the diagonal)~%# A covariance matrix of all zeros will be interpreted as \"covariance unknown\", and to use the~%# data a covariance will have to be assumed or gotten from some other source~%#~%# If you have no estimate for one of the data elements (e.g. your IMU doesn't produce an orientation ~%# estimate), please set element 0 of the associated covariance matrix to -1~%# If you are interpreting this message, please check for a value of -1 in the first element of each ~%# covariance matrix, and disregard the associated estimate.~%~%Header header~%~%geometry_msgs/Quaternion orientation~%float64[9] orientation_covariance # Row major about x, y, z axes~%~%geometry_msgs/Vector3 angular_velocity~%float64[9] angular_velocity_covariance # Row major about x, y, z axes~%~%geometry_msgs/Vector3 linear_acceleration~%float64[9] linear_acceleration_covariance # Row major x, y z ~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: sensor_msgs/BatteryState~%~%# Constants are chosen to match the enums in the linux kernel~%# defined in include/linux/power_supply.h as of version 3.7~%# The one difference is for style reasons the constants are~%# all uppercase not mixed case.~%~%# Power supply status constants~%uint8 POWER_SUPPLY_STATUS_UNKNOWN = 0~%uint8 POWER_SUPPLY_STATUS_CHARGING = 1~%uint8 POWER_SUPPLY_STATUS_DISCHARGING = 2~%uint8 POWER_SUPPLY_STATUS_NOT_CHARGING = 3~%uint8 POWER_SUPPLY_STATUS_FULL = 4~%~%# Power supply health constants~%uint8 POWER_SUPPLY_HEALTH_UNKNOWN = 0~%uint8 POWER_SUPPLY_HEALTH_GOOD = 1~%uint8 POWER_SUPPLY_HEALTH_OVERHEAT = 2~%uint8 POWER_SUPPLY_HEALTH_DEAD = 3~%uint8 POWER_SUPPLY_HEALTH_OVERVOLTAGE = 4~%uint8 POWER_SUPPLY_HEALTH_UNSPEC_FAILURE = 5~%uint8 POWER_SUPPLY_HEALTH_COLD = 6~%uint8 POWER_SUPPLY_HEALTH_WATCHDOG_TIMER_EXPIRE = 7~%uint8 POWER_SUPPLY_HEALTH_SAFETY_TIMER_EXPIRE = 8~%~%# Power supply technology (chemistry) constants~%uint8 POWER_SUPPLY_TECHNOLOGY_UNKNOWN = 0~%uint8 POWER_SUPPLY_TECHNOLOGY_NIMH = 1~%uint8 POWER_SUPPLY_TECHNOLOGY_LION = 2~%uint8 POWER_SUPPLY_TECHNOLOGY_LIPO = 3~%uint8 POWER_SUPPLY_TECHNOLOGY_LIFE = 4~%uint8 POWER_SUPPLY_TECHNOLOGY_NICD = 5~%uint8 POWER_SUPPLY_TECHNOLOGY_LIMN = 6~%~%Header  header~%float32 voltage          # Voltage in Volts (Mandatory)~%float32 temperature      # Temperature in Degrees Celsius (If unmeasured NaN)~%float32 current          # Negative when discharging (A)  (If unmeasured NaN)~%float32 charge           # Current charge in Ah  (If unmeasured NaN)~%float32 capacity         # Capacity in Ah (last full capacity)  (If unmeasured NaN)~%float32 design_capacity  # Capacity in Ah (design capacity)  (If unmeasured NaN)~%float32 percentage       # Charge percentage on 0 to 1 range  (If unmeasured NaN)~%uint8   power_supply_status     # The charging status as reported. Values defined above~%uint8   power_supply_health     # The battery health metric. Values defined above~%uint8   power_supply_technology # The battery chemistry. Values defined above~%bool    present          # True if the battery is present~%~%float32[] cell_voltage   # An array of individual cell voltages for each cell in the pack~%                         # If individual voltages unknown but number of cells known set each to NaN~%float32[] cell_temperature  # An array of individual cell temperatures for each cell in the pack~%                            # If individual temperatures unknown but number of cells known set each to NaN~%string location          # The location into which the battery is inserted. (slot number or plug)~%string serial_number     # The best approximation of the battery serial number~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DroneTelemetry>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
     4 (cl:length (cl:slot-value msg 'mode))
     4 (cl:length (cl:slot-value msg 'flight_mode))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'gps))
     1
     1
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'position_ned))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'velocity_ned))
     4
     4
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'imu))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'battery))
     4
     4
     4
     4
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'vibration))
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DroneTelemetry>))
  "Converts a ROS message object to a list"
  (cl:list 'DroneTelemetry
    (cl:cons ':header (header msg))
    (cl:cons ':armed (armed msg))
    (cl:cons ':mode (mode msg))
    (cl:cons ':flight_mode (flight_mode msg))
    (cl:cons ':gps (gps msg))
    (cl:cons ':gps_fix_type (gps_fix_type msg))
    (cl:cons ':gps_satellites (gps_satellites msg))
    (cl:cons ':position_ned (position_ned msg))
    (cl:cons ':velocity_ned (velocity_ned msg))
    (cl:cons ':relative_altitude_m (relative_altitude_m msg))
    (cl:cons ':heading_deg (heading_deg msg))
    (cl:cons ':imu (imu msg))
    (cl:cons ':battery (battery msg))
    (cl:cons ':current_consumed_mah (current_consumed_mah msg))
    (cl:cons ':cpu_load_percent (cpu_load_percent msg))
    (cl:cons ':comm_drop_rate (comm_drop_rate msg))
    (cl:cons ':freemem_bytes (freemem_bytes msg))
    (cl:cons ':vibration (vibration msg))
    (cl:cons ':pressure_hpa (pressure_hpa msg))
    (cl:cons ':temperature_c (temperature_c msg))
))
