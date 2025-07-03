// Motor 1 Pins
#define PUL1 3
#define DIR1 4

// Motor 2 Pins
#define PUL2 5
#define DIR2 6

// Motor 3 Pins
#define PUL3 7
#define DIR3 8

#define STEP_DELAY 150  // Fixed delay of 10μs

// Motor state structure
struct MotorState {
  bool rotating = false;
  bool direction = HIGH;  // HIGH for CW, LOW for CCW
};

MotorState motor1;
MotorState motor2;
MotorState motor3;

void setup() {
  // Set pin modes
  pinMode(PUL1, OUTPUT);
  pinMode(DIR1, OUTPUT);
  pinMode(PUL2, OUTPUT);
  pinMode(DIR2, OUTPUT);
  pinMode(PUL3, OUTPUT);
  pinMode(DIR3, OUTPUT);

  // Initialize all motor directions
  digitalWrite(DIR1, motor1.direction);
  digitalWrite(DIR2, motor2.direction);
  digitalWrite(DIR3, motor3.direction);

  Serial.begin(115200);
  Serial.println("Triple Stepper Motor Control");
  printHelp();
}

void loop() {
  handleSerialInput();
  pulseStepper(PUL1, motor1);
  pulseStepper(PUL2, motor2);
  pulseStepper(PUL3, motor3);
}

void handleSerialInput() {
  while (Serial.available() > 0) {
    char c = toupper(Serial.read());

    switch (c) {
      // Motor 1 controls
      case 'W':
        motor1.direction = HIGH;
        motor1.rotating = true;
        digitalWrite(DIR1, motor1.direction);
        Serial.println("Motor 1: Rotating CW");
        break;
      case 'S':
        motor1.direction = LOW;
        motor1.rotating = true;
        digitalWrite(DIR1, motor1.direction);
        Serial.println("Motor 1: Rotating CCW");
        break;
      case 'Q':
        motor1.rotating = false;
        Serial.println("Motor 1: Stopped");
        break;

      // Motor 2 controls
      case 'E':
        motor2.direction = HIGH;
        motor2.rotating = true;
        digitalWrite(DIR2, motor2.direction);
        Serial.println("Motor 2: Rotating CW");
        break;
      case 'D':
        motor2.direction = LOW;
        motor2.rotating = true;
        digitalWrite(DIR2, motor2.direction);
        Serial.println("Motor 2: Rotating CCW");
        break;
      case 'A':
        motor2.rotating = false;
        Serial.println("Motor 2: Stopped");
        break;

      // Motor 3 controls
      case 'I':
        motor3.direction = HIGH;
        motor3.rotating = true;
        digitalWrite(DIR3, motor3.direction);
        Serial.println("Motor 3: Rotating CW");
        break;
      case 'K':
        motor3.direction = LOW;
        motor3.rotating = true;
        digitalWrite(DIR3, motor3.direction);
        Serial.println("Motor 3: Rotating CCW");
        break;
      case 'U':
        motor3.rotating = false;
        Serial.println("Motor 3: Stopped");
        break;

      // Help
      case 'H':
        printHelp();
        break;

      default:
        if (c != '\n' && c != '\r') {
          Serial.println("Invalid command. Press H for help.");
        }
    }
  }
}

void pulseStepper(uint8_t pulPin, MotorState motor) {
  if (motor.rotating) {
    digitalWrite(pulPin, HIGH);
    delayMicroseconds(STEP_DELAY / 2);
    digitalWrite(pulPin, LOW);
    delayMicroseconds(STEP_DELAY / 2);
  }
}

void printHelp() {
  Serial.println("Controls:");
  Serial.println("Motor 1:");
  Serial.println("  W - Clockwise (CW)");
  Serial.println("  S - Counter-Clockwise (CCW)");
  Serial.println("  Q - Stop");
  Serial.println("Motor 2:");
  Serial.println("  E - Clockwise (CW)");
  Serial.println("  D - Counter-Clockwise (CCW)");
  Serial.println("  A - Stop");
  Serial.println("Motor 3:");
  Serial.println("  I - Clockwise (CW)");
  Serial.println("  K - Counter-Clockwise (CCW)");
  Serial.println("  U - Stop");
  Serial.println("H - Show this help");
}
