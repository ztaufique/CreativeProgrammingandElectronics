// inspiration from a game I used to play as a kid on coolmathgames.com

String gameState; 
int Xspeed = 4;
int Yspeed = 7;
int impossibleBox = 15;
PImage cookie;
PImage cookiemonster;
color blue = color (#174883);


// moving boxes obstacle
    class MovingBox { //
      float x, y, XSpeed, YSpeed;
  
      MovingBox (float xpos, float ypos) {
        x = xpos;
        y= ypos; 
        XSpeed = Xspeed;
        YSpeed = Yspeed;
       }
    void update () {
        x += Xspeed;
        y += Yspeed;
     }
    void wallCollisions () { // checking for the wall
        if ( (x > 200) || (x < 0)) {
            Xspeed = -Xspeed;
        }
        if ( (y < 200) || (y > 600)) {
          Yspeed = -Yspeed;
        }
    }
    void Box () { //drawing the box
        fill (#174883);
        noStroke();
        rect (x, y, impossibleBox, impossibleBox);
    }
  }
  MovingBox myBox = new MovingBox (100, 200);
  MovingBox myBox1= new MovingBox (150, 250);
  MovingBox myBox2= new MovingBox (75, 300);
  MovingBox myBox3= new MovingBox (125, 350);
  MovingBox myBox4= new MovingBox (25, 400);
  MovingBox myBox5 = new MovingBox (175, 450);


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

void startGame () { // the first screen
  textAlign(CENTER);          // creating the title screen
  PFont f = createFont("COCOMILKRegular", 40);
  textFont(f, 40);
  fill(#174883);
  text("Welcome to Cookie CrazeMaze! Click anywhere to start", width/2, height/2 - 20);
  textSize (30);
  fill (#0f98dc);
  text ("Try to escape the maze before time runs out.\n Grab the cookie to win!", width/2, height/2 + 20);
  
  // click to play
  if (mousePressed == true) {
     gameState = "PLAY"; 
  }
  
}


void playGame () { // game
   strokeWeight (3);
   strokeJoin (ROUND);
   stroke (#0061AC);
   
// cookie monster cursor
  cookiemonster = loadImage ("desktop/Tutoring/CrazeMaze/cookiemonster.png");
     image (cookiemonster, mouseX, mouseY, 40, 40);
  //maze    
     line (200, 0 , 200, 200); // entrance box
     line (0, 200, 75, 200);
     line (125, 200, 200, 200); 
     
     // obstace
       line (200, 200, 200, height -50 ); // obstacle box #2
       line (200, 600, 200, 595);
  //maze continues
  // food box
     line (400, 250, 500, 250); 
     line (400, 250, 400, 350);
     line (500, 250, 500, 350);
     line (500, 350, 475, 350);
     line (400, 350, 425, 350); 
// 0uter box #1 --> boxes that deviate from the food box
     line (350, 200, 550, 200);
     line (350,200, 350, 400);
     line (350, 400, 550, 400);
     line (550, 400, 550, 325);
     line (550, 200, 550, 270);
     line (300, 150, 600, 150); // Outer box #2
     line (300, 150, 300, 175);
     line (300, 450, 300, 225);
     line (300, 450, 325, 450);
     line (375, 450, 600, 450);
     line (600, 450, 600, 150);
     line (250, 100, 450, 100); // Outer box #3 
     line (500, 100, 650, 100);
     line (250, 100, 250, 500);
     line (250, 500, 250, 500);
     line (250, 500, 550, 500);
     line (600, 500, 650, 500);
     line (650, 500, 650, 100);
     line (200, 550, 625, 550); // Outer Box #4
     line (675, 550, 700, 550);
     line (700, 650, 700, 100);
     line (650, 100, 650, 50);
     line (650, 50, 750, 50);
     line (750, 50, 750, 550); // lines that do not fall in box categories (random)
     line (650, 50, 250, 50);
     line (610, 550, 610, 500); // divider lines in maze
     line (330, 100, 330, 150);
     line (650, 400, 600, 400);
     line (500, 400, 500, 450);
     line (500, 340, 550, 340);
     line (500, 340, 500, 330);
     
     // Cookie Image
     cookie = loadImage ("desktop/Tutoring/CrazeMaze/cookie.png");
       image (cookie, 425, 275, 50, 50);
// game winning and losing
    if (get(mouseX, mouseY) == blue) {
      gameState = "LOSE";
    }
    
    if (mouseX == 425 && mouseY==275) {
      gameState = "WIN";
    }
}

void winGame () {
  fill (0);
  textAlign(CENTER);          // creating the winning title screen
  PFont f = createFont("COCOMILKRegular", 40);
  textFont(f, 40);
  fill(#174883);
  text("Congrats! Cookie Monster is no longer hungry!", width/2, height/2 - 20);
  textSize (30);
  fill (#0f98dc);
  text ("Play Again?", width/2, height/2 + 20);
    if (mousePressed == true) {
      gameState = "START";
  }
}

void loseGame() {
  fill (0);
  textAlign(CENTER);          // creating the losing title screen
  PFont f = createFont("COCOMILKRegular", 40);
  textFont(f, 40);
  fill(#174883);
  text("Uh oh! You missed the cookie, and Cookie Monster is still hungry", width/2, height/2 - 20);
  textSize (30);
  fill (#0f98dc);
  text ("Try Again!", width/2, height/2 + 20);
     if (mousePressed == true) {
      gameState = "START";
     }
}


void clearbackground () {
  fill (#EBEBEB);
  rect (0, 0, width, height);
}
