## 🔧 Python-Based Inverse Kinematics & Serial Communication

This Python script allows the user to input a 3D coordinate and orientation (roll, pitch, yaw), compute the corresponding joint angles for a robotic arm using inverse kinematics, and send the angles to an Arduino over serial.

---

### 📂 File: `send_angles.py`

#### ✅ Features:
- Takes `x, y, z` position and `roll, pitch, yaw` as input.
- Converts orientation to radians.
- Calls the `get_angles()` function (from `armControl.py`) to compute IK.
- Sanitizes complex or invalid angles.
- Converts angles from radians to degrees.
- Sends angle data over serial (e.g., `COM6`) to the Arduino.
- Prints Arduino response for confirmation.

---

### 🔗 Dependencies
- `pyserial`
- `time`
- `math`

Install required package:

```bash
pip install pyserial

