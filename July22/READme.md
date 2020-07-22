For this assignment, I wanted to integrate the idea of a home alarm system with the LEDs and light sensors. To "activate" the alarm, you must press the button, which will prompt both the LED lights to turn on. This represents that the alarm system is functioning correctly. The lights stay on once you press the button, but in the Serial area, the words indicate the alarm's status. When you press the button, it writes, "Welcome to your home alarm system." When you cover the light sensor, it shows that "Intruder Present!" This represents a motion sensor's idea: a home system tracks motion to determine if there is an intruder. As the photoresistor follows the light values, it represents this idea, and the computer reads "Intruder Present!" When there is no light being cover, the computer reads "No Intruder." 

The most challenging part of the assignment was the assembling of the circuit. Many of the terms used, such as "ground" or "digital" vs. "analog," were things I could not understand. In the beginning, I stared at the circuit, not knowing where to begin. As I continued to add more wires (and reread the lecture notes), I started to understand the importance of resistors, knowing where to place colored cables, and which part of the objects (such as LEDs, resistors, and wires) should be connected to the ground or voltage side. However, I learned this the hard way when I blew right through two LEDs because I incorrectly placed ground wires and resistors. I also initially struggled with keeping the light on for the home system. First, I tried to use conditional statements, which worked for the computer readings, but not for the lights. I realized that I needed to use state variables to ensure that the lights stayed on. 

I had the most fun drawing the schematic because it was like seeing the whole assignment come together. After hours of trial and error, it was fun to draw out the wires and resistors and note how everything was connected to create a satisfying result.

![](/July22/circuit.png)

![](/July22/circuit1.png)

![](/July22/schematic7_22.png)

![](/July22/homealarm.png)
This is the message shown when you press the button


![](/July22/homealarm1.png)
This is the message shown when you cover the photo resistor

