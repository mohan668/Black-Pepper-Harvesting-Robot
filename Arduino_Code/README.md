# Triple Stepper Motor Control – Arduino

This Arduino sketch is designed to control **three stepper motors** using **TB6600 motor drivers**. Each motor can rotate in clockwise (CW) or counter-clockwise (CCW) direction, and can be independently started or stopped via serial commands.

---

## 🧠 Features

- Controls 3 stepper motors (Motor 1, 2, and 3)
- Serial command-based interface
- Supports CW, CCW rotation, and stop for each motor
- Help menu via serial monitor (`H` command)

---

## 🔌 Pin Configuration

| Motor | PUL (Step Pin) | DIR (Direction Pin) |
|-------|----------------|---------------------|
| 1     | D3             | D4                  |
| 2     | D5             | D6                  |
| 3     | D7             | D8                  |

> Ensure motor drivers are powered appropriately and connected to the respective Arduino pins.

---

## 🕹️ Serial Commands

Use the **Serial Monitor** (baud rate: `115200`) to send these character-based commands:

### Motor 1
- `W` – Rotate CW  
- `S` – Rotate CCW  
- `Q` – Stop

### Motor 2
- `E` – Rotate CW  
- `D` – Rotate CCW  
- `A` – Stop

### Motor 3
- `I` – Rotate CW  
- `K` – Rotate CCW  
- `U` – Stop

### Other
- `H` – Show help menu

---

## ⚙️ Configuration

- **STEP_DELAY**: Adjust `#define STEP_DELAY 150` to modify speed. Lower values increase motor speed.
- **Microstepping**: Ensure microstepping is correctly set on the TB6600 (e.g., 1/8 or 1/16 as needed).

---

## 📦 Dependencies

None. Uses built-in `Arduino` functions only.

---

## 📷 Example

![Stepper Motor Setup](media/motor-setup.jpg)  
*Image showing Arduino-TB6600-stepper wiring (add your own photo here)*

---

## 🛠️ Usage

1. Connect motors and drivers as per pin configuration.
2. Upload the sketch to Arduino.
3. Open Serial Monitor (`115200 baud`).
4. Enter control characters to rotate or stop each motor.

---

## 🧾 License

This code is open-source under the MIT License. Feel free to use and modify.
