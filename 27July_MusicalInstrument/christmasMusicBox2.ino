/* I was inspired by the code from Professor Shiloh's example for tone without delay for the music
  https://github.com/michaelshiloh/toneMelodyAndBlinkWithoutDelay/blob/master/toneMelodyWithoutDelay/toneMelodyWithoutDelay.ino, and an episode from Phineas and Ferb inpired my Christmas in July Theme*/

#include "pitches.h"
#include <Servo.h>


/* 4 - Quarter Note
   8 - Eight Note
   2 - Half Note
   3.5 - Dotted Quarter Note
*/


//All I for Want for Christmas  https://images.app.goo.gl/SXYqNmiW6tKbrYPx8
int allIWantForChistmas [] = {
  NOTE_C3, NOTE_E3, NOTE_G3, NOTE_B3, NOTE_C4, NOTE_B3, NOTE_A3, NOTE_G3, NOTE_D4, NOTE_C4, NOTE_C4, NOTE_B3, NOTE_C4, NOTE_B3
  , NOTE_A3, NOTE_G2, NOTE_G2, NOTE_F2, NOTE_A3, NOTE_C4, NOTE_D4, NOTE_E4, NOTE_D4, NOTE_C4, NOTE_A3, NOTE_F3, NOTE_GS1, NOTE_C4
  , NOTE_D4, NOTE_DS4, NOTE_D4, NOTE_AS3, NOTE_GS3
};
int mariahDurations [] = {
  4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 8, 8, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4
};


int potPin = 0;
int val;
int interval = 0;

// Jingle Bells https://images.app.goo.gl/dhNZESWnox1dSrew7
int jingleBells [] = {
  NOTE_E3, NOTE_E3, NOTE_E3, NOTE_E3, NOTE_E3, NOTE_E3, NOTE_E3, NOTE_G3, NOTE_C3, NOTE_D3, NOTE_E3, NOTE_F3, NOTE_F3, NOTE_F3
  , NOTE_F3, NOTE_F3, NOTE_E3, NOTE_E3, NOTE_E3, NOTE_E3, NOTE_E3, NOTE_D3, NOTE_D3, NOTE_E3, NOTE_D3, NOTE_G3, NOTE_E3, NOTE_E3
  , NOTE_E3, NOTE_E3, NOTE_E3, NOTE_E3, NOTE_E3, NOTE_G3, NOTE_C3, NOTE_D3, NOTE_E3, NOTE_F3, NOTE_F3, NOTE_F3, NOTE_F3
  , NOTE_F3, NOTE_E3, NOTE_E3, NOTE_E3, NOTE_E3, NOTE_G3, NOTE_G3, NOTE_F3, NOTE_D3, NOTE_C3,
};
int pierpontDurations [] = {
  4, 4, 2, 4, 4, 2, 4, 4, 3.5, 8, 1, 4, 4, 3.5, 8, 4, 4, 4, 8, 8, 4, 4, 4, 4, 2, 2, 4, 4, 2, 4, 4, 2, 4, 4, 3.5, 8, 1, 4, 4, 4, 4,
  4, 4, 4, 8, 8, 4, 4, 4, 4, 1,
};


//Let It Snow https://images.app.goo.gl/c5rBYaoXZ8YSFKr2A
int letItSnow [] = {
  131, 131, NOTE_C4, NOTE_C4, NOTE_AS3, NOTE_A3, NOTE_G3, NOTE_F4, 131, 131, 131, NOTE_G3, NOTE_F3, NOTE_G3, NOTE_F3, NOTE_E3, 131,
  NOTE_D3, NOTE_D4, NOTE_D4, NOTE_C4, NOTE_AS3, NOTE_A3, NOTE_G3, NOTE_E4, NOTE_D4, NOTE_C4, NOTE_C4, NOTE_AS3, NOTE_A3, NOTE_A3, NOTE_G3,
  NOTE_F3, 131, NOTE_F3, NOTE_E3, NOTE_F3, NOTE_G3, NOTE_A3, NOTE_G3, NOTE_E3, NOTE_C4
};
int styneDurations [] = {
  8, 8, 8, 8, 4, 4, 4, 4, 2, 8, 8, 3.5, 8, 3.5, 8, 4, 2, 4, 8, 8, 4, 4, 4, 2, 8, 8, 4, 8, 8, 4, 8, 8, 2, 4, 2, 8, 8, 8, 8, 4, 4, 4
};

int jingle [] = {
  NOTE_C6
};

int jingleDuration [] = {4} ;




#include <Servo.h>
Servo myservo;
int christmasBuzzer = 8; // for the piezzo buzzer

unsigned long previousMillis = 0;
unsigned long buttonMillis = 0;
int thisNote = 0;
int pauseBetweenNotes;

int pos = 0;



void setup() {
  // put your setup code here, to run once:
  pinMode (christmasBuzzer, OUTPUT); // where the piezzo buzzer is plugged in
  pinMode (A0, INPUT); //light sensor
  pinMode (11, INPUT); // green button
  pinMode (6, INPUT); // blue button
  myservo.attach (9);

}

void loop() {
  // based on the light readings, you were able to adjust which song you wanted to listen to
  unsigned long currentMillis = millis(); // to track the time
  int light = analogRead (A0);
  int redButton = 0;
  int greenButton = 0;


  if ((light > 0) && (light < 300)) { // All I Want for Christmas - play the song if a certain light state is detected
    if (currentMillis - previousMillis >= pauseBetweenNotes) {
      previousMillis = currentMillis;

      int mariahDuration = 1000 / mariahDurations[thisNote];  // so the song sounds more "melodic" rather than jumbled
      tone(8, allIWantForChistmas[thisNote], mariahDuration);

      pauseBetweenNotes = mariahDuration * 1.30;

      thisNote++;
      if ( thisNote > + 32 ) { // how many notes the song has
        thisNote = 0;
      } // restarting the song
    }
  }

  if ((light > 300) && (light < 600)) { //Let It Snow
    if (currentMillis - previousMillis >= pauseBetweenNotes) {
      previousMillis = currentMillis;

      int styneDuration = 1000 / styneDurations[thisNote];
      tone(8, letItSnow[thisNote], styneDuration);

      pauseBetweenNotes = styneDuration * 1.30;

      thisNote++;
      if ( thisNote > + 42 ) { // how many notes the song has
        thisNote = 0;
      } // restarting the song
    }
  }

  if (light > 600) {  // Jingle Bells
    if (currentMillis - previousMillis >= pauseBetweenNotes) {
      previousMillis = currentMillis;

      int pierpontDuration = 1000 / pierpontDurations[thisNote];
      tone(8, jingleBells[thisNote], pierpontDuration);

      pauseBetweenNotes = pierpontDuration * 1.30;

      thisNote++;
      if ( thisNote > + 52 ) { // how many notes the song has
        thisNote = 0;
      } // restarting the song
    }
  }

  // the servo hitting the bells

  // so the servo moves without delay -- this shows it moving without the use of the button
  /* for (pos = 0; pos <= 180; pos += 1) { // goes from 0 degrees to 180 degrees
     // in steps of 1 degree
     myservo.write (pos);           // tell servo to go to position in variable 'pos'
    }
    for (pos = 180; pos >= 0; pos -= 1); { // goes from 180 degrees to 0 degrees
     myservo.write(pos);              // tell servo to go to position in variable 'pos'
    }
    }*/
  // with the use of the button
  int fastButton = digitalRead (4);
  if (fastButton == HIGH)
    for (pos = 0; pos <= 180; pos += 1) { // goes from 0 degrees to 180 degrees
      // in steps of 1 degree
      myservo.write (pos);           // tell servo to go to position in variable 'pos'
    }
  for (pos = 180; pos >= 0; pos -= 1); { // goes from 180 degrees to 0 degrees
    myservo.write(pos);
  }
}
