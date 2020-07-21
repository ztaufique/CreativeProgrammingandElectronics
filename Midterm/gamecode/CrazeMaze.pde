// inspiration from a game I used to play on coolmathgames.com

String gameState; 
int Xspeed = 7; // for the moving boxes and cookies
int Yspeed = 10;
int impossibleBox = 15; // size of the moving boxes
PImage cookie; // images inserted
PImage cookiemonster;
PImage cookiecraze;
PImage losegame;
PImage wingame;
int x = 0; //global variable used for the playgame gamestate
int y= 0;

import processing.sound.*; // adding the sound effects
SoundFile mychomp; 
// new mychomp (this, "chompsound.wav"); // sound bite http://soundbible.com/1968-Apple-Bite.html
SoundFile gamemusic; //https://soundcloud.com/user-512388516/fun-quirky-music-loop-pack-volume-1-sampler


void setup () {
  size (800, 600); 
  gameState = "START" ;

  //Loading the soundfile
  mychomp = new SoundFile (this, "chompsound.wav");
  gamemusic = new SoundFile (this, "Gamemusic.mp3");

  gamemusic.loop();
} 




void draw() {

  clearbackground (); //making the background blank
  if (gameState == "START") {  // determining game states
    startGame();
  } 
  if (gameState == "PLAY") {
    playGame ();
    myBox.update (); // position of the ball
    myBox1.update ();
    myBox2.update ();
    myBox3.update ();
    myBox4.update ();
    myBox5.update ();
    myBox.wallCollisions(); // position in relation to the wall
    myBox1.wallCollisions();
    myBox2.wallCollisions();
    myBox3.wallCollisions();
    myBox4.wallCollisions();
    myBox5.wallCollisions();
    myBox.Box(); // draw the rectangle
    myBox1.Box();
    myBox2.Box();
    myBox3.Box();
    myBox4.Box();
    myBox5.Box ();

    cookies0.update (); // cookies
    cookies1.update ();
    cookies2.update ();
    cookies3.update ();
    cookies4.update ();
    cookies5.update ();
    cookies6.update ();
    cookies7.update ();
    cookies8.update ();
    cookies9.update ();
    cookies10.update ();
    cookies11.update ();
    cookies12.update ();
    cookies13.update ();
    cookies14.update ();
    cookies15.update ();
    cookies16.update ();

    cookies0.cookieCollisions (); // position in relation to the wall
    cookies1.cookieCollisions ();
    cookies2.cookieCollisions ();
    cookies3.cookieCollisions ();
    cookies4.cookieCollisions ();
    cookies5.cookieCollisions ();
    cookies6.cookieCollisions ();
    cookies7.cookieCollisions ();
    cookies8.cookieCollisions ();
    cookies9.cookieCollisions ();
    cookies10.cookieCollisions ();
    cookies11.cookieCollisions ();
    cookies12.cookieCollisions ();
    cookies13.cookieCollisions ();
    cookies14.cookieCollisions ();
    cookies15.cookieCollisions ();
    cookies16.cookieCollisions ();

    cookies0.cookieimage (); // draw the cookies
    cookies1.cookieimage ();
    cookies2.cookieimage ();
    cookies3.cookieimage ();
    cookies4.cookieimage ();
    cookies5.cookieimage ();
    cookies6.cookieimage ();
    cookies7.cookieimage ();
    cookies8.cookieimage ();
    cookies9.cookieimage ();
    cookies10.cookieimage();
    cookies11.cookieimage ();
    cookies12.cookieimage();
    cookies13.cookieimage ();
    cookies14.cookieimage ();
    cookies15.cookieimage ();
    cookies16.cookieimage ();
  } 
  if (gameState == "WIN") {
    winGame();
  } 
  if (gameState == "LOSE") {
    loseGame ();
  }
}




void clearbackground () {
  fill (#EBEBEB);
  rect (0, 0, width, height);
}
