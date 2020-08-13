/* Zarah Taufique
 Professor Michael Shiloh 
 DSN INV 23, Summer 2020
 14, August 2020
 Final Project
 
 For my final project, I decided to create a smart shower. I have many younger siblings 
 (ranging from 5 - 11) that often take up to 30 minutes in the shower: singing, dancing, 
 and doing everything that is far from the purpose of a shower. With so many people at my 
 house - my grandparents, siblings, and parents - water wastage is inevitable. So, I decided 
 that I wanted to create something that helps reduce this problem. The smart shower's purpose is to 
 track the amount of time for each task: soap, shampoo, conditioner, and rinsing. After a total of 7 
 minutes, the shower will be automatically turned off. Two minutes are alloted for inital rinsing, two 
 minutes are alloted for soap, two minutes are alloted for shampoo, and the remaining minute is to rinse
 all the leftover suds.
 
 For the timer, I used help from this YouTube video: https://www.youtube.com/watch?v=JXqukW44Dhs&t=294s
 Background image inspiration from: https://natureofcode.com/book/chapter-3-oscillation/#chapter03_section6
 */
 
 // joining Arduino and Processing together
import processing.serial.*;
byte showerLoop; // initialzing the showerLoop byte from Arduino
Serial myPort; // creating object from serial class
String value; // Data received from the port

import processing.sound.*; // adding the music: https://youtu.be/B_v3O5UQg4I
SoundFile lowFi;

float startAngle = 0; // the angle for the moving circles
float angelVel = 0.2; // angle at which they move


String showerState;
PImage startScreen;
PImage aboutShower;
PImage endShowerImage;
PFont arial; // font for the large text
PFont arial1; // font for the smaller text
boolean aboutClicked;


// timer variable
Timer countDownTimer1;

// the states of time for the different shower states
int timeLeft1;
int timeLeft2;
int timeLeft3;
int timeLeft4;


void setup () {
  size (1000, 700);
  showerState = "WELCOME";

  countDownTimer1 = new Timer (1000);


  timeLeft1 = 420;
  timeLeft2 = 300;
  timeLeft3 = 180;
  timeLeft4 = 60;

  // loading the soundfile
  lowFi = new SoundFile (this, "lowFi.mp3");
  lowFi.loop ();
  
  // loading Arduino
  myPort = new Serial (this, Serial.list () [2], 9600);
}

void draw () {
  clearbackground (); // making the background blank
  if (showerState == "WELCOME") { //initial state
    welcomeShower();
  }

  if (showerState == "START") {
    startShower();
  }

  if (showerState == "DONE") {
    endShower ();
  }

  if (showerState == "ABOUT") {
    aboutSmartShower ();
  }
}

void clearbackground () {
  fill (#EBEBEB);
  rect (0, 0, width, height);
}
