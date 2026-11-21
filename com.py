import serial.tools.list_ports

ports = serial.tools.list_ports.comports()

for port in ports:
    print(f"Порт: {port.device}")
    print(f"Описание: {port.description}")
    print(f"HWID: {port.hwid}")
    print("-" * 30)
