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