// Auto-generated. Do not edit!

// (in-package drone_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let sensor_msgs = _finder('sensor_msgs');
let geometry_msgs = _finder('geometry_msgs');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class DroneTelemetry {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.armed = null;
      this.mode = null;
      this.flight_mode = null;
      this.gps = null;
      this.gps_fix_type = null;
      this.gps_satellites = null;
      this.position_ned = null;
      this.velocity_ned = null;
      this.relative_altitude_m = null;
      this.heading_deg = null;
      this.imu = null;
      this.battery = null;
      this.current_consumed_mah = null;
      this.cpu_load_percent = null;
      this.comm_drop_rate = null;
      this.freemem_bytes = null;
      this.vibration = null;
      this.pressure_hpa = null;
      this.temperature_c = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('armed')) {
        this.armed = initObj.armed
      }
      else {
        this.armed = false;
      }
      if (initObj.hasOwnProperty('mode')) {
        this.mode = initObj.mode
      }
      else {
        this.mode = '';
      }
      if (initObj.hasOwnProperty('flight_mode')) {
        this.flight_mode = initObj.flight_mode
      }
      else {
        this.flight_mode = '';
      }
      if (initObj.hasOwnProperty('gps')) {
        this.gps = initObj.gps
      }
      else {
        this.gps = new sensor_msgs.msg.NavSatFix();
      }
      if (initObj.hasOwnProperty('gps_fix_type')) {
        this.gps_fix_type = initObj.gps_fix_type
      }
      else {
        this.gps_fix_type = 0;
      }
      if (initObj.hasOwnProperty('gps_satellites')) {
        this.gps_satellites = initObj.gps_satellites
      }
      else {
        this.gps_satellites = 0;
      }
      if (initObj.hasOwnProperty('position_ned')) {
        this.position_ned = initObj.position_ned
      }
      else {
        this.position_ned = new geometry_msgs.msg.Point();
      }
      if (initObj.hasOwnProperty('velocity_ned')) {
        this.velocity_ned = initObj.velocity_ned
      }
      else {
        this.velocity_ned = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('relative_altitude_m')) {
        this.relative_altitude_m = initObj.relative_altitude_m
      }
      else {
        this.relative_altitude_m = 0.0;
      }
      if (initObj.hasOwnProperty('heading_deg')) {
        this.heading_deg = initObj.heading_deg
      }
      else {
        this.heading_deg = 0.0;
      }
      if (initObj.hasOwnProperty('imu')) {
        this.imu = initObj.imu
      }
      else {
        this.imu = new sensor_msgs.msg.Imu();
      }
      if (initObj.hasOwnProperty('battery')) {
        this.battery = initObj.battery
      }
      else {
        this.battery = new sensor_msgs.msg.BatteryState();
      }
      if (initObj.hasOwnProperty('current_consumed_mah')) {
        this.current_consumed_mah = initObj.current_consumed_mah
      }
      else {
        this.current_consumed_mah = 0.0;
      }
      if (initObj.hasOwnProperty('cpu_load_percent')) {
        this.cpu_load_percent = initObj.cpu_load_percent
      }
      else {
        this.cpu_load_percent = 0.0;
      }
      if (initObj.hasOwnProperty('comm_drop_rate')) {
        this.comm_drop_rate = initObj.comm_drop_rate
      }
      else {
        this.comm_drop_rate = 0.0;
      }
      if (initObj.hasOwnProperty('freemem_bytes')) {
        this.freemem_bytes = initObj.freemem_bytes
      }
      else {
        this.freemem_bytes = 0.0;
      }
      if (initObj.hasOwnProperty('vibration')) {
        this.vibration = initObj.vibration
      }
      else {
        this.vibration = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('pressure_hpa')) {
        this.pressure_hpa = initObj.pressure_hpa
      }
      else {
        this.pressure_hpa = 0.0;
      }
      if (initObj.hasOwnProperty('temperature_c')) {
        this.temperature_c = initObj.temperature_c
      }
      else {
        this.temperature_c = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type DroneTelemetry
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [armed]
    bufferOffset = _serializer.bool(obj.armed, buffer, bufferOffset);
    // Serialize message field [mode]
    bufferOffset = _serializer.string(obj.mode, buffer, bufferOffset);
    // Serialize message field [flight_mode]
    bufferOffset = _serializer.string(obj.flight_mode, buffer, bufferOffset);
    // Serialize message field [gps]
    bufferOffset = sensor_msgs.msg.NavSatFix.serialize(obj.gps, buffer, bufferOffset);
    // Serialize message field [gps_fix_type]
    bufferOffset = _serializer.uint8(obj.gps_fix_type, buffer, bufferOffset);
    // Serialize message field [gps_satellites]
    bufferOffset = _serializer.uint8(obj.gps_satellites, buffer, bufferOffset);
    // Serialize message field [position_ned]
    bufferOffset = geometry_msgs.msg.Point.serialize(obj.position_ned, buffer, bufferOffset);
    // Serialize message field [velocity_ned]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.velocity_ned, buffer, bufferOffset);
    // Serialize message field [relative_altitude_m]
    bufferOffset = _serializer.float32(obj.relative_altitude_m, buffer, bufferOffset);
    // Serialize message field [heading_deg]
    bufferOffset = _serializer.float32(obj.heading_deg, buffer, bufferOffset);
    // Serialize message field [imu]
    bufferOffset = sensor_msgs.msg.Imu.serialize(obj.imu, buffer, bufferOffset);
    // Serialize message field [battery]
    bufferOffset = sensor_msgs.msg.BatteryState.serialize(obj.battery, buffer, bufferOffset);
    // Serialize message field [current_consumed_mah]
    bufferOffset = _serializer.float32(obj.current_consumed_mah, buffer, bufferOffset);
    // Serialize message field [cpu_load_percent]
    bufferOffset = _serializer.float32(obj.cpu_load_percent, buffer, bufferOffset);
    // Serialize message field [comm_drop_rate]
    bufferOffset = _serializer.float32(obj.comm_drop_rate, buffer, bufferOffset);
    // Serialize message field [freemem_bytes]
    bufferOffset = _serializer.float32(obj.freemem_bytes, buffer, bufferOffset);
    // Serialize message field [vibration]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.vibration, buffer, bufferOffset);
    // Serialize message field [pressure_hpa]
    bufferOffset = _serializer.float32(obj.pressure_hpa, buffer, bufferOffset);
    // Serialize message field [temperature_c]
    bufferOffset = _serializer.float32(obj.temperature_c, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type DroneTelemetry
    let len;
    let data = new DroneTelemetry(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [armed]
    data.armed = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [mode]
    data.mode = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [flight_mode]
    data.flight_mode = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [gps]
    data.gps = sensor_msgs.msg.NavSatFix.deserialize(buffer, bufferOffset);
    // Deserialize message field [gps_fix_type]
    data.gps_fix_type = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [gps_satellites]
    data.gps_satellites = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [position_ned]
    data.position_ned = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset);
    // Deserialize message field [velocity_ned]
    data.velocity_ned = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [relative_altitude_m]
    data.relative_altitude_m = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [heading_deg]
    data.heading_deg = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [imu]
    data.imu = sensor_msgs.msg.Imu.deserialize(buffer, bufferOffset);
    // Deserialize message field [battery]
    data.battery = sensor_msgs.msg.BatteryState.deserialize(buffer, bufferOffset);
    // Deserialize message field [current_consumed_mah]
    data.current_consumed_mah = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [cpu_load_percent]
    data.cpu_load_percent = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [comm_drop_rate]
    data.comm_drop_rate = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [freemem_bytes]
    data.freemem_bytes = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [vibration]
    data.vibration = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [pressure_hpa]
    data.pressure_hpa = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [temperature_c]
    data.temperature_c = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += _getByteLength(object.mode);
    length += _getByteLength(object.flight_mode);
    length += sensor_msgs.msg.NavSatFix.getMessageSize(object.gps);
    length += sensor_msgs.msg.Imu.getMessageSize(object.imu);
    length += sensor_msgs.msg.BatteryState.getMessageSize(object.battery);
    return length + 115;
  }

  static datatype() {
    // Returns string type for a message object
    return 'drone_msgs/DroneTelemetry';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a1270bfbdee5c98ac6beb53ce8f27ba9';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # DroneTelemetry.msg — единый снимок телеметрии
    std_msgs/Header header
    
    # --- Состояние полёта ---
    bool   armed
    string mode              # PX4/ArduPilot mode, напр. "STABILIZE", "OFFBOARD"
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
    # A covariance matrix of all zeros will be interpreted as "covariance unknown", and to use the
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new DroneTelemetry(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.armed !== undefined) {
      resolved.armed = msg.armed;
    }
    else {
      resolved.armed = false
    }

    if (msg.mode !== undefined) {
      resolved.mode = msg.mode;
    }
    else {
      resolved.mode = ''
    }

    if (msg.flight_mode !== undefined) {
      resolved.flight_mode = msg.flight_mode;
    }
    else {
      resolved.flight_mode = ''
    }

    if (msg.gps !== undefined) {
      resolved.gps = sensor_msgs.msg.NavSatFix.Resolve(msg.gps)
    }
    else {
      resolved.gps = new sensor_msgs.msg.NavSatFix()
    }

    if (msg.gps_fix_type !== undefined) {
      resolved.gps_fix_type = msg.gps_fix_type;
    }
    else {
      resolved.gps_fix_type = 0
    }

    if (msg.gps_satellites !== undefined) {
      resolved.gps_satellites = msg.gps_satellites;
    }
    else {
      resolved.gps_satellites = 0
    }

    if (msg.position_ned !== undefined) {
      resolved.position_ned = geometry_msgs.msg.Point.Resolve(msg.position_ned)
    }
    else {
      resolved.position_ned = new geometry_msgs.msg.Point()
    }

    if (msg.velocity_ned !== undefined) {
      resolved.velocity_ned = geometry_msgs.msg.Vector3.Resolve(msg.velocity_ned)
    }
    else {
      resolved.velocity_ned = new geometry_msgs.msg.Vector3()
    }

    if (msg.relative_altitude_m !== undefined) {
      resolved.relative_altitude_m = msg.relative_altitude_m;
    }
    else {
      resolved.relative_altitude_m = 0.0
    }

    if (msg.heading_deg !== undefined) {
      resolved.heading_deg = msg.heading_deg;
    }
    else {
      resolved.heading_deg = 0.0
    }

    if (msg.imu !== undefined) {
      resolved.imu = sensor_msgs.msg.Imu.Resolve(msg.imu)
    }
    else {
      resolved.imu = new sensor_msgs.msg.Imu()
    }

    if (msg.battery !== undefined) {
      resolved.battery = sensor_msgs.msg.BatteryState.Resolve(msg.battery)
    }
    else {
      resolved.battery = new sensor_msgs.msg.BatteryState()
    }

    if (msg.current_consumed_mah !== undefined) {
      resolved.current_consumed_mah = msg.current_consumed_mah;
    }
    else {
      resolved.current_consumed_mah = 0.0
    }

    if (msg.cpu_load_percent !== undefined) {
      resolved.cpu_load_percent = msg.cpu_load_percent;
    }
    else {
      resolved.cpu_load_percent = 0.0
    }

    if (msg.comm_drop_rate !== undefined) {
      resolved.comm_drop_rate = msg.comm_drop_rate;
    }
    else {
      resolved.comm_drop_rate = 0.0
    }

    if (msg.freemem_bytes !== undefined) {
      resolved.freemem_bytes = msg.freemem_bytes;
    }
    else {
      resolved.freemem_bytes = 0.0
    }

    if (msg.vibration !== undefined) {
      resolved.vibration = geometry_msgs.msg.Vector3.Resolve(msg.vibration)
    }
    else {
      resolved.vibration = new geometry_msgs.msg.Vector3()
    }

    if (msg.pressure_hpa !== undefined) {
      resolved.pressure_hpa = msg.pressure_hpa;
    }
    else {
      resolved.pressure_hpa = 0.0
    }

    if (msg.temperature_c !== undefined) {
      resolved.temperature_c = msg.temperature_c;
    }
    else {
      resolved.temperature_c = 0.0
    }

    return resolved;
    }
};

module.exports = DroneTelemetry;
