/* Zarah Taufique
  Professor Michael Shiloh
  DSN INV 23, Summer 2020
  14, August 2020
  Final Project

  Using help from Professor Shiloh's motor example

  This is the interactive portion of my smart shower. The arduino initiates the shower to turn on,
  and the piezzo buzzer gives you a warning between each stage of the shower.

*/
#include "pitches.h"

/* 4 - Quarter Note
   8 - Eight Note
   2 - Half Note
*/


const int ain1Pin = 13;
const int ain2Pin = 12;
const int pwmAPin = 11;

const int bin1Pin = 8;
const int bin2Pin = 9;
const int pwmBPin = 10;

int timerBuzzerPin = 7;

//tracking time to determine when the motor should move
unsigned long currentMillis = millis (); // to track time
const long runningTime = 3000; // How long the motor will run
const long firstTurn = 3000; // time at which the first turn occurs
const long lastTurn = 420000; // time at which the final turn occurs
const long done = 423000;

// tracking the time so the buzzer plays a sound
const long twoMin0 = 120000; // two minutes in
const long twoMin1 = 240000; // four minutes in
const long twoMin2 = 360000; // six minutes in
const long oneMin0 = 420000; // seven minutes in
unsigned long previousMillis = 0;
int thisNote = 0;
int pauseBetweenNotes;

// The tune of the buzzer that serves as the timer buzzer
int timerBuzzer [] = {
  NOTE_C4, NOTE_C4, NOTE_C4, NOTE_C4
};

int buzzerDuration [] = {
  8, 4, 8, 4
};

void setup() {
  Serial.begin (9600);

  pinMode(ain1Pin, OUTPUT);
  pinMode(ain2Pin, OUTPUT);
  pinMode(pwmAPin, OUTPUT); // not needed really
  pinMode (timerBuzzerPin, OUTPUT);
}

void loop() {

  unsigned long currentMillis = millis ();

  // tracking the time for the motors

  if (currentMillis <= firstTurn) { // the motor will turn the shower on for three seconds
    // turn in one direction, full speed
    Serial.println("turning the shower on");
    analogWrite(pwmAPin, 255);
    digitalWrite(ain1Pin, HIGH);
    digitalWrite(ain2Pin, LOW);

  } else if ((currentMillis >= firstTurn ) && (currentMillis <= 420000)) { // shows that the shower is turned on - occurs until the seven minute mark
    digitalWrite(ain1Pin, LOW);
    digitalWrite(ain2Pin, LOW);
    Serial.println("the shower is currently on");
  }
  if (currentMillis == lastTurn) { // the motor will turn the shower off

    // turn in the other direction, full speed
    Serial.println("turning the shower off");
    analogWrite(pwmAPin, 255);
    digitalWrite(ain1Pin, LOW);
    digitalWrite(ain2Pin, HIGH);

  } else if (currentMillis >= done) // after three seconds, the motor will turn off and it will be indicated that the shower is done
    // turning off the motor
    Serial.println ("shower is done");
  digitalWrite (ain1Pin, LOW);
  digitalWrite (ain2Pin, HIGH);

  // tracking the time for the piezzo buzzer

  if  ((currentMillis <= firstTurn) || (currentMillis == twoMin0) || (currentMillis == twoMin1) || (currentMillis == twoMin2) || (currentMillis == oneMin0)) {

    int buzzerDurations = 500 / buzzerDuration [thisNote]; // so there is a slight pause
    tone (7, timerBuzzer [thisNote], buzzerDurations);

    pauseBetweenNotes = buzzerDurations * 1.30;
    Serial.println ("next stage!");
  }
}
