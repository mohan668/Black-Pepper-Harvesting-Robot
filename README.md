## Phase 1 – Robotic Arm Development ✅

### Overview:
Phase 1 focused on designing and building the core robotic arm system that forms the foundation of the black pepper harvesting robot. This phase emphasized mechanical design, motor control, and establishing wireless communication between a mobile application and the robotic system.

### Completed Tasks:
- Designed and fabricated a 5-DOF robotic arm using lightweight PVC pipes, ensuring sufficient range of motion for vertical and horizontal reach.
- Used NEMA 17 stepper motors with gearboxes to drive each joint, providing precision and torque suitable for pick-and-place operations.
- Integrated TB6600 motor drivers with the motors, and interfaced them with an Arduino Uno for low-level control.
- Programmed the Arduino to receive serial commands and control stepper motor direction and rotation.
- Connected the Arduino to a Raspberry Pi using USB serial communication.
- Built a Flutter-based mobile application with an intuitive UI to send movement commands (joint angles or actions).
- Deployed a FastAPI backend on the Raspberry Pi to act as a bridge between the Flutter app and Arduino, enabling control over Wi-Fi.
- Verified end-to-end communication and successfully controlled the robotic arm wirelessly using the app.

---

## Phase 2 – Upcoming Objectives 🚧

- Design and fabricate a scissor lift mechanism to elevate the robotic arm for vertical reach.
- Integrate a depth sensor and camera to detect black pepper clusters and estimate distance for precise picking.
- Develop a functional end effector suitable for grasping and harvesting pepper from vines.
