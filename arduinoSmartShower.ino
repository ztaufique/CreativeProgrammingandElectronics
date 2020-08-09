// using help from Professor Shiloh's motor example

const int ain1Pin = 13;
const int ain2Pin = 12;
const int pwmAPin = 11;

const int bin1Pin = 8;
const int bin2Pin = 9;
const int pwmBPin = 10;

//tracking time to determine when the motor should move
unsigned long previousMillis = 0;
unsigned long currentMillis = millis (); // to track time 
const long runningTime = 3000; // How long the motor will run
const long firstTurn = 3; // time at which the first turn occurs
const long lastTurn = 420000; // time at which the final turn occurs

void setup() {
  Serial.begin (9600);
  
  pinMode(ain1Pin, OUTPUT);
  pinMode(ain2Pin, OUTPUT);
  pinMode(pwmAPin, OUTPUT); // not needed really
}

void loop() {

if (currentMillis <= firstTurn) {
  // turn in one direction, full speed
  Serial.println("turning the shower on");
  analogWrite(pwmAPin, 255);
  digitalWrite(ain1Pin, HIGH);
  digitalWrite(ain2Pin, LOW);
  // stay here for a second
 // delay(runningTime);
} else if ((currentMillis  >= firstTurn ) || (currentMillis  <= 420000)) {
  digitalWrite(ain1Pin, LOW);
  digitalWrite(ain2Pin, LOW);
  Serial.println("the shower is currently on");
}
if (currentMillis == lastTurn) {

  // turn in the other direction, full speed
  Serial.println("turning the shower off");
  analogWrite(pwmAPin, 255);
  digitalWrite(ain1Pin, LOW);
  digitalWrite(ain2Pin, HIGH);
  // stay here for a second
 // delay(runningTime);
  }
}
