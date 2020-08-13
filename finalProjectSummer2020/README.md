Final Project Video: https://youtu.be/C3pj2TU1Wu4

     In the United States, showering and bathing are the most significant indoor uses of water domestically at a whopping 27%. Access to water is often taken granted, and the Earth's supply is rapidly dwindling. Knowing this and from observing my family's water habits, I decided to create a Smart Shower that tracks the amount of time you have to take a shower. 

![](/finalProjectSummer2020/welcomeShower.png)

I created a small model shower and used a servo to act as the shower handle. The processing app initiates the knob to turn on the shower, which, in turn, indicates that the shower is turned on. The background of the timer mimics the movement of waves. Once the shower is on, there is a setup timer that tracks the seconds for about 7 minutes. In those 7 minutes, a person has 2 minutes to initially get wet, 2 minutes to shampoo, 2 minutes for soap, and 1 minute for the final rinse. During each interval, the piezo buzzer gives off a noise that indicates that the person should move onto the next stage of the shower.  At the end of the 7 minutes, the servo motor turns off and turns to its initial position, indicating that the shower is done.

![](/finalProjectSummer2020/timerSmartShower.png)

One problem that I faced was trying to get the shower hand to move. I initially used an H bridge and motors but found that they were too weak, so I ended up using the Servo. I also had trouble integrating the Arduino controls into Processing. I often got the "nullPointerException" warning, but when I initialized the byte function, I was about to overcome this issue.

My midterm was a significant aspect of my project that was very helpful when creating my shower. I implemented the idea of "game states" when determining the shower stages, so it was beneficial to refer back to it. I had the most fun just seeing the whole project come to life. Seeing the shower knob turn as the Processing Application initiated the movement was very satisfying.

![](/finalProjectSummer2020/smartShowerProduct0.PNG)
![](/finalProjectSummer2020/smartShowerProduct1.PNG)
![](/finalProjectSummer2020/smartShowerSchematic.JPG)

