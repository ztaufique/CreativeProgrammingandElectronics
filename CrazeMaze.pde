// inspiration from a game I used to play on coolmathgames.com

String gameState; 
int Xspeed = 4;
int Yspeed = 7;
int impossibleBox = 15;
PImage cookie;
PImage cookiemonster;
PImage cookiecraze;
int x = 0;
int y= 0;
 
void setup () {
  size (800, 600); 
  gameState = "START" ;
} 

  
  

void draw() {
  
  clearbackground ();
     if (gameState == "START") {
       startGame();
   } if (gameState == "PLAY") {
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
        
   } if (gameState == "WIN") {
        winGame();
   } if (gameState == "LOSE") {
        loseGame ();
   }
       
}




void clearbackground () {
  fill (#EBEBEB);
  rect (0, 0, width, height);
}
