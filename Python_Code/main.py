import serial
import time
from math import radians
from armControl import get_angles

def sanitize_angle(angle, tolerance=1e-6):
    if isinstance(angle, complex):
        if abs(angle.imag) < tolerance:
            return angle.real
        else:
            raise ValueError(f"Angle has significant imaginary part: {angle}")
    return angle

def send_to_arduino(angles, port='COM6', baudrate=9600):
    try:
        ser = serial.Serial(port, baudrate, timeout=1)
        time.sleep(2)  # Wait for Arduino to initialize

        angles = [sanitize_angle(a) for a in angles]

        angles_deg = [round(a * 180 / 3.14159, 2) for a in angles]
        message = ','.join(map(str, angles_deg)) + '\n'

        print(f"Sending to Arduino: {message.strip()}")
        ser.write(message.encode('utf-8'))

        time.sleep(0.5)
        if ser.in_waiting:
            response = ser.readline().decode().strip()
            print(f"Arduino responded: {response}")

        ser.close()
    except Exception as e:
        print(f"Error sending to Arduino: {e}")

def main():
    x = float(input("Enter X coordinate: "))
    y = float(input("Enter Y coordinate: "))
    z = float(input("Enter Z coordinate: "))
    roll = radians(float(input("Enter roll (in degrees): ")))
    pitch = radians(float(input("Enter pitch (in degrees): ")))
    yaw = radians(float(input("Enter yaw (in degrees): ")))

    try:
        q1, q2, q3, q4, q5, q6 = get_angles(x, y, z, roll, pitch, yaw)
        print(f"Joint Angles (radians): {[round(a, 4) for a in [q1, q2, q3, q4, q5, q6]]}")

        # Send only q1, q2, q3 for now
        send_to_arduino([q1, q2, q3])
    except Exception as e:
        print("Error computing IK:", e)

if __name__ == "__main__":
    main()
