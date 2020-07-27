#include <Servo.h> 

int servoPos = 0; // to  store the position of the servo
Servo jingleBell;


// using servo without delay

void bells () { 

  unsigned long currentMillis = millis(); // tracking time

  int fastButton = digitalRead (6);
  int slowButton = digitalRead (5);
  
  if ((fastButton == HIGH) && (slowButton == LOW)) {
    // servo pulses at a fast speed
    for (servoPos = 0; servoPos<= 180; servoPos += 1) {
      jingleBell.write (servoPos);
      delay (15);
    }
    for (servoPos = 180; servoPos>= 0; servoPos -= 1) {
      jingleBell.write (servoPos);
      delay (15);
    }
  } 
  else if ((fastButton == LOW) && (slowButton == LOW) ){
   // servo pulses at a normal speed
   for (servoPos = 0; servoPos<= 180; servoPos += 1) {
      jingleBell.write (servoPos);
      delay (10);
    }
    for (servoPos = 180; servoPos>= 0; servoPos -= 1) {
      jingleBell.write (servoPos);
      delay (10);
    }

  }
  else if((fastButton == LOW) && (slowButton == HIGH)) {
  // servo pulses at a slow speed
    for (servoPos = 0; servoPos<= 180; servoPos += 1) {
      jingleBell.write (servoPos);
      delay (25);
    }
    for (servoPos = 180; servoPos>= 0; servoPos -= 1) {
      jingleBell.write (servoPos);
      delay (25);
    }
    }    
}
