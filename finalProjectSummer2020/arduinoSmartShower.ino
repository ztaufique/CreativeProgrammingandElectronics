/* Zarah Taufique
  Professor Michael Shiloh
  DSN INV 23, Summer 2020
  14, August 2020
  Final Project

  Using help from Ada Fruit's sweep without delay example https://learn.adafruit.com/multi-tasking-the-arduino-part-1/a-clean-sweep

  This is the interactive portion of my smart shower. The arduino initiates the shower to turn on,
  and the piezo buzzer gives you a warning between each stage of the shower.

*/

#include "pitches.h"
# include <Servo.h>


class Knob // creating a class to control the servo without delay for the shower knob
{
    Servo servo;
    int pos = 0; // the current servo position
    int increment; // how much the servo should move with each interval
    int updateInterval = 0; // interval between updates
    unsigned long lastUpdate = 0; // last update of the position

  public:
    Knob (int interval) {
      updateInterval = interval;
      increment = 3;
    }

    void Attach (int pin)
    { servo.attach (pin);
      servo.write(0); // initializing that the current position of the servo motor should not change
    }

    void Update0 () // the servo moves down to show that the shower is turned on
    { if ((millis() - lastUpdate) > updateInterval) // time to update
      {
        lastUpdate = millis();
        pos += increment;
        servo.write(pos);

      } if (pos >= 120) { // where I want the shower knob to end
        increment = 0;
      }
    }
    void Update1 () // the servo moves back up to the original position to show that the shower is turned off
    { if ((millis() - lastUpdate) > updateInterval)
      { lastUpdate = millis();
        pos += -3; // the orginial increment but moving in the opppsite direction
        servo.write(pos);

      }
    }
};

Knob knob (0); // initializing the class


// length of the notes
/* 4 - Quarter Note
   8 - Eight Note
   2 - Half Note
*/


int timerBuzzerPin = 7; // the piezo buzzer

//tracking time to determine when the servo should move
unsigned long currentMillis = millis (); // to track time
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

int buzzerDuration [] = { // how long each note lasts
  8, 4, 8, 4
};

void setup() {
  Serial.begin (9600);
  while (!Serial) { // to make sure the USB port is initialized
    ;
  }

  knob.Attach (9); // initializing the class at pin 9

  pinMode (timerBuzzerPin, OUTPUT);
}

void loop() {

  byte showerLoop ;

  if (Serial.available ()) {

    showerLoop = Serial.read();

    int pos = 0;

    unsigned long currentMillis = millis ();
    const long runningTime = 3000; // How long the motor will run
    const long firstTurn = 3000; // time at which the first turn occurs
    const long lastTurn = 420000; // time at which the final turn occurs
    const long done = 421000;

    // tracking the time so the buzzer plays a sound
    const long twoMin0 = 120000; // two minutes in
    const long twoMin1 = 240000; // four minutes in
    const long twoMin2 = 360000; // six minutes in
    const long oneMin0 = 420000; // seven minutes in

    // tracking the time for the motors
    if ((currentMillis >= 1000) && currentMillis <= firstTurn) { // the motor will turn the shower on for three seconds
      // turn in one direction, full speed
      knob.Update0 ();
      Serial.println("turning the shower on");

    }

    else if ((currentMillis >= firstTurn ) && (currentMillis <= 420000)) { // shows that the shower is turned on - occurs until the seven minute mark

      Serial.println("the shower is currently on");
    }
    if ((currentMillis >= lastTurn) && (currentMillis <= done)) { // the motor will turn the shower off

      // turn in the other direction, full speed
      Serial.println("turning the shower off");


      int buzzerDurations = 500 / buzzerDuration [thisNote]; // so there is a slight pause
      tone (7, timerBuzzer [thisNote], buzzerDurations);

      pauseBetweenNotes = buzzerDurations * 1.30;
    }
    else if (currentMillis >= done) { // after three seconds, the motor will turn off and it will be indicated that the shower is done
      // turning off the motor
      knob.Update1 ();
      Serial.println ("shower is done");
    }


    // initializing the piezzo buzzer for the stages

    if  (currentMillis <= firstTurn) {

      int buzzerDurations = 500 / buzzerDuration [thisNote]; // so there is a slight pause
      tone (7, timerBuzzer [thisNote], buzzerDurations);

      pauseBetweenNotes = buzzerDurations * 1.30;
      Serial.println ("next stage!");
    }

    if ((currentMillis >= twoMin0) && (currentMillis <= 123000)) {
      int buzzerDurations = 500 / buzzerDuration [thisNote]; // so there is a slight pause
      tone (7, timerBuzzer [thisNote], buzzerDurations);

      pauseBetweenNotes = buzzerDurations * 1.30;
      Serial.println ("next stage!");
    }
    if ((currentMillis >= twoMin1) && (currentMillis <= 243000)) {
      int buzzerDurations = 500 / buzzerDuration [thisNote]; // so there is a slight pause
      tone (7, timerBuzzer [thisNote], buzzerDurations);

      pauseBetweenNotes = buzzerDurations * 1.30;
      Serial.println ("next stage!");
    }

    if ((currentMillis >= twoMin2) && (currentMillis <= 363000)) {
      int buzzerDurations = 500 / buzzerDuration [thisNote]; // so there is a slight pause
      tone (7, timerBuzzer [thisNote], buzzerDurations);

      pauseBetweenNotes = buzzerDurations * 1.30;
      Serial.println ("next stage!");
    }
  }
}