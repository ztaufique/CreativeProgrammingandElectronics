/* I was inspired by the code from Professor Shiloh's example for tone without delay for the music
  https://github.com/michaelshiloh/toneMelodyAndBlinkWithoutDelay/blob/master/toneMelodyWithoutDelay/toneMelodyWithoutDelay.ino */



#include "pitches.h"
int christmasBuzzer = 8; // for the piezzo buzzer

unsigned long previousMillis = 0;
int thisNote = 0;
int pauseBetweenNotes;


void setup() {
  // put your setup code here, to run once:
  pinMode (christmasBuzzer, OUTPUT); // where the piezzo buzzer is plugged in
  pinMode (A0, INPUT); //light sensor
  pinMode (6, INPUT); // green button
  pinMode (5, INPUT); // blue button

}

void loop() {
  // based on the light readings, you were able to adjust which song you wanted to listen to
  unsigned long currentMillis = millis(); // to track the time
  int light = analogRead (A0);

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
}
