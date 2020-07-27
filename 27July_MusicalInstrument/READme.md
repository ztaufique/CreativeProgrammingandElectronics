For this assignment, I was initially inspired to do a Christmas themed musical "instrument" after watching an episode of Phineas and Ferb about Christmas in July. I sought out to have three different songs played, which the user was able to choose, and the servo move back and forth to represent the jingle bells. The button (switch #2) was used to control if the bell was on or off. I used the photoresistor (switch #1) to control which song would be played: if the light were very high, All I Want for Christmas would play, if the light was at a medium value, Let it Snow was played, and if the light was low or at a value of zero, Jingle Bells would play. 

Automating the servo and the piezo buzzer at the same time was the most challenging part of the assignment for me. I initially used the delay () function to run through each song, but I quickly learned that it would not be possible to have each aspect of the instrument work simultaneously. Using inspiration from Professor Shiloh's music example, I used the concept of time to determine when the music would be played and how the servo would function. My downfall was when I wanted to use the button to control if the servo was on or off with the button. No matter how I would code, the buttons would only affect the speed of the music, rather than the servo. However after much trial and error, the button is able to decrease the speed of the servo motor. I realized that my initial code had been within a loop that was inside the light function, causing the song to be affected as well.  

![](/27July_MusicalInstrument/box2.jpeg)
![](/27July_MusicalInstrument/box3.jpeg)
![](/27July_MusicalInstrument/schematicChristmasMusicBox.jpg)


The link to my instrument being played https://youtu.be/HQavQHXJRCI. The working instrument uses one button, not two, but my videographer was not available for the second take.



