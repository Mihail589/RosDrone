;; Auto-generated. Do not edit!


(when (boundp 'drone_msgs::DroneTelemetry)
  (if (not (find-package "DRONE_MSGS"))
    (make-package "DRONE_MSGS"))
  (shadow 'DroneTelemetry (find-package "DRONE_MSGS")))
(unless (find-package "DRONE_MSGS::DRONETELEMETRY")
  (make-package "DRONE_MSGS::DRONETELEMETRY"))

(in-package "ROS")
;;//! \htmlinclude DroneTelemetry.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass drone_msgs::DroneTelemetry
  :super ros::object
  :slots (_header _armed _mode _flight_mode _gps _gps_fix_type _gps_satellites _position_ned _velocity_ned _relative_altitude_m _heading_deg _imu _battery _current_consumed_mah _cpu_load_percent _comm_drop_rate _freemem_bytes _vibration _pressure_hpa _temperature_c ))

(defmethod drone_msgs::DroneTelemetry
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:armed __armed) nil)
    ((:mode __mode) "")
    ((:flight_mode __flight_mode) "")
    ((:gps __gps) (instance sensor_msgs::NavSatFix :init))
    ((:gps_fix_type __gps_fix_type) 0)
    ((:gps_satellites __gps_satellites) 0)
    ((:position_ned __position_ned) (instance geometry_msgs::Point :init))
    ((:velocity_ned __velocity_ned) (instance geometry_msgs::Vector3 :init))
    ((:relative_altitude_m __relative_altitude_m) 0.0)
    ((:heading_deg __heading_deg) 0.0)
    ((:imu __imu) (instance sensor_msgs::Imu :init))
    ((:battery __battery) (instance sensor_msgs::BatteryState :init))
    ((:current_consumed_mah __current_consumed_mah) 0.0)
    ((:cpu_load_percent __cpu_load_percent) 0.0)
    ((:comm_drop_rate __comm_drop_rate) 0.0)
    ((:freemem_bytes __freemem_bytes) 0.0)
    ((:vibration __vibration) (instance geometry_msgs::Vector3 :init))
    ((:pressure_hpa __pressure_hpa) 0.0)
    ((:temperature_c __temperature_c) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _armed __armed)
   (setq _mode (string __mode))
   (setq _flight_mode (string __flight_mode))
   (setq _gps __gps)
   (setq _gps_fix_type (round __gps_fix_type))
   (setq _gps_satellites (round __gps_satellites))
   (setq _position_ned __position_ned)
   (setq _velocity_ned __velocity_ned)
   (setq _relative_altitude_m (float __relative_altitude_m))
   (setq _heading_deg (float __heading_deg))
   (setq _imu __imu)
   (setq _battery __battery)
   (setq _current_consumed_mah (float __current_consumed_mah))
   (setq _cpu_load_percent (float __cpu_load_percent))
   (setq _comm_drop_rate (float __comm_drop_rate))
   (setq _freemem_bytes (float __freemem_bytes))
   (setq _vibration __vibration)
   (setq _pressure_hpa (float __pressure_hpa))
   (setq _temperature_c (float __temperature_c))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:armed
   (&optional (__armed :null))
   (if (not (eq __armed :null)) (setq _armed __armed)) _armed)
  (:mode
   (&optional __mode)
   (if __mode (setq _mode __mode)) _mode)
  (:flight_mode
   (&optional __flight_mode)
   (if __flight_mode (setq _flight_mode __flight_mode)) _flight_mode)
  (:gps
   (&rest __gps)
   (if (keywordp (car __gps))
       (send* _gps __gps)
     (progn
       (if __gps (setq _gps (car __gps)))
       _gps)))
  (:gps_fix_type
   (&optional __gps_fix_type)
   (if __gps_fix_type (setq _gps_fix_type __gps_fix_type)) _gps_fix_type)
  (:gps_satellites
   (&optional __gps_satellites)
   (if __gps_satellites (setq _gps_satellites __gps_satellites)) _gps_satellites)
  (:position_ned
   (&rest __position_ned)
   (if (keywordp (car __position_ned))
       (send* _position_ned __position_ned)
     (progn
       (if __position_ned (setq _position_ned (car __position_ned)))
       _position_ned)))
  (:velocity_ned
   (&rest __velocity_ned)
   (if (keywordp (car __velocity_ned))
       (send* _velocity_ned __velocity_ned)
     (progn
       (if __velocity_ned (setq _velocity_ned (car __velocity_ned)))
       _velocity_ned)))
  (:relative_altitude_m
   (&optional __relative_altitude_m)
   (if __relative_altitude_m (setq _relative_altitude_m __relative_altitude_m)) _relative_altitude_m)
  (:heading_deg
   (&optional __heading_deg)
   (if __heading_deg (setq _heading_deg __heading_deg)) _heading_deg)
  (:imu
   (&rest __imu)
   (if (keywordp (car __imu))
       (send* _imu __imu)
     (progn
       (if __imu (setq _imu (car __imu)))
       _imu)))
  (:battery
   (&rest __battery)
   (if (keywordp (car __battery))
       (send* _battery __battery)
     (progn
       (if __battery (setq _battery (car __battery)))
       _battery)))
  (:current_consumed_mah
   (&optional __current_consumed_mah)
   (if __current_consumed_mah (setq _current_consumed_mah __current_consumed_mah)) _current_consumed_mah)
  (:cpu_load_percent
   (&optional __cpu_load_percent)
   (if __cpu_load_percent (setq _cpu_load_percent __cpu_load_percent)) _cpu_load_percent)
  (:comm_drop_rate
   (&optional __comm_drop_rate)
   (if __comm_drop_rate (setq _comm_drop_rate __comm_drop_rate)) _comm_drop_rate)
  (:freemem_bytes
   (&optional __freemem_bytes)
   (if __freemem_bytes (setq _freemem_bytes __freemem_bytes)) _freemem_bytes)
  (:vibration
   (&rest __vibration)
   (if (keywordp (car __vibration))
       (send* _vibration __vibration)
     (progn
       (if __vibration (setq _vibration (car __vibration)))
       _vibration)))
  (:pressure_hpa
   (&optional __pressure_hpa)
   (if __pressure_hpa (setq _pressure_hpa __pressure_hpa)) _pressure_hpa)
  (:temperature_c
   (&optional __temperature_c)
   (if __temperature_c (setq _temperature_c __temperature_c)) _temperature_c)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; bool _armed
    1
    ;; string _mode
    4 (length _mode)
    ;; string _flight_mode
    4 (length _flight_mode)
    ;; sensor_msgs/NavSatFix _gps
    (send _gps :serialization-length)
    ;; uint8 _gps_fix_type
    1
    ;; uint8 _gps_satellites
    1
    ;; geometry_msgs/Point _position_ned
    (send _position_ned :serialization-length)
    ;; geometry_msgs/Vector3 _velocity_ned
    (send _velocity_ned :serialization-length)
    ;; float32 _relative_altitude_m
    4
    ;; float32 _heading_deg
    4
    ;; sensor_msgs/Imu _imu
    (send _imu :serialization-length)
    ;; sensor_msgs/BatteryState _battery
    (send _battery :serialization-length)
    ;; float32 _current_consumed_mah
    4
    ;; float32 _cpu_load_percent
    4
    ;; float32 _comm_drop_rate
    4
    ;; float32 _freemem_bytes
    4
    ;; geometry_msgs/Vector3 _vibration
    (send _vibration :serialization-length)
    ;; float32 _pressure_hpa
    4
    ;; float32 _temperature_c
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; bool _armed
       (if _armed (write-byte -1 s) (write-byte 0 s))
     ;; string _mode
       (write-long (length _mode) s) (princ _mode s)
     ;; string _flight_mode
       (write-long (length _flight_mode) s) (princ _flight_mode s)
     ;; sensor_msgs/NavSatFix _gps
       (send _gps :serialize s)
     ;; uint8 _gps_fix_type
       (write-byte _gps_fix_type s)
     ;; uint8 _gps_satellites
       (write-byte _gps_satellites s)
     ;; geometry_msgs/Point _position_ned
       (send _position_ned :serialize s)
     ;; geometry_msgs/Vector3 _velocity_ned
       (send _velocity_ned :serialize s)
     ;; float32 _relative_altitude_m
       (sys::poke _relative_altitude_m (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _heading_deg
       (sys::poke _heading_deg (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; sensor_msgs/Imu _imu
       (send _imu :serialize s)
     ;; sensor_msgs/BatteryState _battery
       (send _battery :serialize s)
     ;; float32 _current_consumed_mah
       (sys::poke _current_consumed_mah (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _cpu_load_percent
       (sys::poke _cpu_load_percent (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _comm_drop_rate
       (sys::poke _comm_drop_rate (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _freemem_bytes
       (sys::poke _freemem_bytes (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; geometry_msgs/Vector3 _vibration
       (send _vibration :serialize s)
     ;; float32 _pressure_hpa
       (sys::poke _pressure_hpa (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _temperature_c
       (sys::poke _temperature_c (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; bool _armed
     (setq _armed (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _mode
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _mode (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _flight_mode
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _flight_mode (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; sensor_msgs/NavSatFix _gps
     (send _gps :deserialize buf ptr-) (incf ptr- (send _gps :serialization-length))
   ;; uint8 _gps_fix_type
     (setq _gps_fix_type (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _gps_satellites
     (setq _gps_satellites (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; geometry_msgs/Point _position_ned
     (send _position_ned :deserialize buf ptr-) (incf ptr- (send _position_ned :serialization-length))
   ;; geometry_msgs/Vector3 _velocity_ned
     (send _velocity_ned :deserialize buf ptr-) (incf ptr- (send _velocity_ned :serialization-length))
   ;; float32 _relative_altitude_m
     (setq _relative_altitude_m (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _heading_deg
     (setq _heading_deg (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; sensor_msgs/Imu _imu
     (send _imu :deserialize buf ptr-) (incf ptr- (send _imu :serialization-length))
   ;; sensor_msgs/BatteryState _battery
     (send _battery :deserialize buf ptr-) (incf ptr- (send _battery :serialization-length))
   ;; float32 _current_consumed_mah
     (setq _current_consumed_mah (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _cpu_load_percent
     (setq _cpu_load_percent (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _comm_drop_rate
     (setq _comm_drop_rate (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _freemem_bytes
     (setq _freemem_bytes (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; geometry_msgs/Vector3 _vibration
     (send _vibration :deserialize buf ptr-) (incf ptr- (send _vibration :serialization-length))
   ;; float32 _pressure_hpa
     (setq _pressure_hpa (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _temperature_c
     (setq _temperature_c (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get drone_msgs::DroneTelemetry :md5sum-) "a1270bfbdee5c98ac6beb53ce8f27ba9")
(setf (get drone_msgs::DroneTelemetry :datatype-) "drone_msgs/DroneTelemetry")
(setf (get drone_msgs::DroneTelemetry :definition-)
      "# DroneTelemetry.msg — единый снимок телеметрии
std_msgs/Header header

# --- Состояние полёта ---
bool   armed
string mode              # PX4/ArduPilot mode, напр. \"STABILIZE\", \"OFFBOARD\"
string flight_mode       # MAVSDK FlightMode enum как строка

# --- GPS / глобальная позиция ---
sensor_msgs/NavSatFix gps
uint8  gps_fix_type      # 0=no fix, 2=2D, 3=3D
uint8  gps_satellites

# --- Локальная позиция и скорость (NED) ---
geometry_msgs/Point    position_ned     # x=north, y=east, z=down, м
geometry_msgs/Vector3  velocity_ned     # м/с
float32 relative_altitude_m
float32 heading_deg

# --- Ориентация и угловые скорости ---
sensor_msgs/Imu imu

# --- Батарея ---
sensor_msgs/BatteryState battery
float32 current_consumed_mah   # NaN, если не поддерживается

# --- Система ---
float32 cpu_load_percent       # SYS_STATUS.load / 10
float32 comm_drop_rate         # SYS_STATUS.drop_rate_comm / 100
float32 freemem_bytes          # MEMINFO.freemem

# --- Вибрации (м/с²) ---
geometry_msgs/Vector3 vibration

# --- Барометр ---
float32 pressure_hpa           # SCALED_PRESSURE.press_abs
float32 temperature_c
================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: sensor_msgs/NavSatFix
# Navigation Satellite fix for any Global Navigation Satellite System
#
# Specified using the WGS 84 reference ellipsoid

# header.stamp specifies the ROS time for this measurement (the
#        corresponding satellite time may be reported using the
#        sensor_msgs/TimeReference message).
#
# header.frame_id is the frame of reference reported by the satellite
#        receiver, usually the location of the antenna.  This is a
#        Euclidean frame relative to the vehicle, not a reference
#        ellipsoid.
Header header

# satellite fix status information
NavSatStatus status

# Latitude [degrees]. Positive is north of equator; negative is south.
float64 latitude

# Longitude [degrees]. Positive is east of prime meridian; negative is west.
float64 longitude

# Altitude [m]. Positive is above the WGS 84 ellipsoid
# (quiet NaN if no altitude is available).
float64 altitude

# Position covariance [m^2] defined relative to a tangential plane
# through the reported position. The components are East, North, and
# Up (ENU), in row-major order.
#
# Beware: this coordinate system exhibits singularities at the poles.

float64[9] position_covariance

# If the covariance of the fix is known, fill it in completely. If the
# GPS receiver provides the variance of each measurement, put them
# along the diagonal. If only Dilution of Precision is available,
# estimate an approximate covariance from that.

uint8 COVARIANCE_TYPE_UNKNOWN = 0
uint8 COVARIANCE_TYPE_APPROXIMATED = 1
uint8 COVARIANCE_TYPE_DIAGONAL_KNOWN = 2
uint8 COVARIANCE_TYPE_KNOWN = 3

uint8 position_covariance_type

================================================================================
MSG: sensor_msgs/NavSatStatus
# Navigation Satellite fix status for any Global Navigation Satellite System

# Whether to output an augmented fix is determined by both the fix
# type and the last time differential corrections were received.  A
# fix is valid when status >= STATUS_FIX.

int8 STATUS_NO_FIX =  -1        # unable to fix position
int8 STATUS_FIX =      0        # unaugmented fix
int8 STATUS_SBAS_FIX = 1        # with satellite-based augmentation
int8 STATUS_GBAS_FIX = 2        # with ground-based augmentation

int8 status

# Bits defining which Global Navigation Satellite System signals were
# used by the receiver.

uint16 SERVICE_GPS =     1
uint16 SERVICE_GLONASS = 2
uint16 SERVICE_COMPASS = 4      # includes BeiDou.
uint16 SERVICE_GALILEO = 8

uint16 service

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
float64 z
================================================================================
MSG: sensor_msgs/Imu
# This is a message to hold data from an IMU (Inertial Measurement Unit)
#
# Accelerations should be in m/s^2 (not in g's), and rotational velocity should be in rad/sec
#
# If the covariance of the measurement is known, it should be filled in (if all you know is the 
# variance of each measurement, e.g. from the datasheet, just put those along the diagonal)
# A covariance matrix of all zeros will be interpreted as \"covariance unknown\", and to use the
# data a covariance will have to be assumed or gotten from some other source
#
# If you have no estimate for one of the data elements (e.g. your IMU doesn't produce an orientation 
# estimate), please set element 0 of the associated covariance matrix to -1
# If you are interpreting this message, please check for a value of -1 in the first element of each 
# covariance matrix, and disregard the associated estimate.

Header header

geometry_msgs/Quaternion orientation
float64[9] orientation_covariance # Row major about x, y, z axes

geometry_msgs/Vector3 angular_velocity
float64[9] angular_velocity_covariance # Row major about x, y, z axes

geometry_msgs/Vector3 linear_acceleration
float64[9] linear_acceleration_covariance # Row major x, y z 

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

================================================================================
MSG: sensor_msgs/BatteryState

# Constants are chosen to match the enums in the linux kernel
# defined in include/linux/power_supply.h as of version 3.7
# The one difference is for style reasons the constants are
# all uppercase not mixed case.

# Power supply status constants
uint8 POWER_SUPPLY_STATUS_UNKNOWN = 0
uint8 POWER_SUPPLY_STATUS_CHARGING = 1
uint8 POWER_SUPPLY_STATUS_DISCHARGING = 2
uint8 POWER_SUPPLY_STATUS_NOT_CHARGING = 3
uint8 POWER_SUPPLY_STATUS_FULL = 4

# Power supply health constants
uint8 POWER_SUPPLY_HEALTH_UNKNOWN = 0
uint8 POWER_SUPPLY_HEALTH_GOOD = 1
uint8 POWER_SUPPLY_HEALTH_OVERHEAT = 2
uint8 POWER_SUPPLY_HEALTH_DEAD = 3
uint8 POWER_SUPPLY_HEALTH_OVERVOLTAGE = 4
uint8 POWER_SUPPLY_HEALTH_UNSPEC_FAILURE = 5
uint8 POWER_SUPPLY_HEALTH_COLD = 6
uint8 POWER_SUPPLY_HEALTH_WATCHDOG_TIMER_EXPIRE = 7
uint8 POWER_SUPPLY_HEALTH_SAFETY_TIMER_EXPIRE = 8

# Power supply technology (chemistry) constants
uint8 POWER_SUPPLY_TECHNOLOGY_UNKNOWN = 0
uint8 POWER_SUPPLY_TECHNOLOGY_NIMH = 1
uint8 POWER_SUPPLY_TECHNOLOGY_LION = 2
uint8 POWER_SUPPLY_TECHNOLOGY_LIPO = 3
uint8 POWER_SUPPLY_TECHNOLOGY_LIFE = 4
uint8 POWER_SUPPLY_TECHNOLOGY_NICD = 5
uint8 POWER_SUPPLY_TECHNOLOGY_LIMN = 6

Header  header
float32 voltage          # Voltage in Volts (Mandatory)
float32 temperature      # Temperature in Degrees Celsius (If unmeasured NaN)
float32 current          # Negative when discharging (A)  (If unmeasured NaN)
float32 charge           # Current charge in Ah  (If unmeasured NaN)
float32 capacity         # Capacity in Ah (last full capacity)  (If unmeasured NaN)
float32 design_capacity  # Capacity in Ah (design capacity)  (If unmeasured NaN)
float32 percentage       # Charge percentage on 0 to 1 range  (If unmeasured NaN)
uint8   power_supply_status     # The charging status as reported. Values defined above
uint8   power_supply_health     # The battery health metric. Values defined above
uint8   power_supply_technology # The battery chemistry. Values defined above
bool    present          # True if the battery is present

float32[] cell_voltage   # An array of individual cell voltages for each cell in the pack
                         # If individual voltages unknown but number of cells known set each to NaN
float32[] cell_temperature  # An array of individual cell temperatures for each cell in the pack
                            # If individual temperatures unknown but number of cells known set each to NaN
string location          # The location into which the battery is inserted. (slot number or plug)
string serial_number     # The best approximation of the battery serial number

")



(provide :drone_msgs/DroneTelemetry "a1270bfbdee5c98ac6beb53ce8f27ba9")


