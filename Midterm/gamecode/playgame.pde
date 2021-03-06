boolean showimage = true;
int score = 0;


void playGame () { // game
  maze ();
  // initial color tracking for game winning and losing
  scoreBoard();
  mouseMoved () ;
}



void mouseMoved () { // tracking the colors to determine if your cursor touches the blue --> if it does, you lose

  loadPixels();
  color trackColor;

  trackColor = color (#174883); 

  int x; // x, y coordinates to make detections
  int y; 

  int loc = mouseX + mouseY*width;

  // figuring out the colors
  color currentColor = pixels [loc]; // determined from a computer vision tutorial https://www.youtube.com/watch?v=h8tk0hmWB44
  float r1 = red (currentColor);
  float g1 = green (currentColor);
  float b1 = blue (currentColor);
  float r2 = red (trackColor);
  float g2 = green (trackColor);
  float b2 = blue (trackColor);

  float d = dist (r1, g1, b1, r2, g2, b2); // using distance formula to compare colors 

  if (d < 20) {
    gameState = "LOSE";
  }
}

// scoring the game

void scoreBoard () { // making the scoreboard in the corner of the game

  fill (#174883);
  rect (30, 20, 100, 30, 7); 
  textAlign (CENTER);
  PFont f = createFont("COCOMILKRegular", 20);
  textFont(f, 20);
  fill(#EBEBEB);  
  text ("Score:" + score, 55, 43);

  if (score > 20) { // how to win the game
    gameState = "WIN";
  }
}




void maze () { // drawing the maze and creating the cursor
  strokeWeight (4);
  strokeJoin (ROUND);
  stroke(#174883);
  //maze 
  line (200, 0, 200, 200); // entrance box
  line (0, 200, 75, 200);
  line (125, 200, 200, 200); 

  // obstace
  line (200, 200, 200, height - 50 ); // obstacle box #2
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
  line (350, 200, 350, 400);
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

  // cookie monster cursor   
  cookiemonster = loadImage ("desktop/Tutoring/CrazeMaze/cookiemonster.png"); // cookie color : #ffb049
  image (cookiemonster, mouseX, mouseY, 30, 30);
}




class cookies { //creating the floating cookies
  float x, y, XSpeed, YSpeed;

  cookies (float xpos, float ypos) {
    x = xpos;
    y= ypos; 
    XSpeed = Xspeed;
    YSpeed = Yspeed;
  }
  void update () { //checking for collisions
    x += Xspeed;
    y += Yspeed;
  }
  void cookieCollisions () { // checking for the wall
    if ( (x < 200) || (x > 800)) {
      Xspeed = -Xspeed;
    }
    if ( (y < 0) || (y > 600)) {
      Yspeed = -Yspeed;
    }
  }
  void cookieimage () { //drawing the box
    cookie = loadImage ("desktop/Tutoring/CrazeMaze/cookie.png");
    image (cookie, x, y, 20, 20);  

    if (dist (x, y, mouseX, mouseY) < 10) { // press to increase score
      score = score + 1; 
      mychomp.play ();
    }
  }
}

// making the cookies, I only wanted a certain amount in calculated spots so I opted to make the cookies individually 

cookies cookies0 = new cookies(350, 160);
cookies cookies1 = new cookies(450, 125);
cookies cookies2 = new cookies(500, 150);
cookies cookies3 = new cookies(375, 75);
cookies cookies4 = new cookies(350, 340);
cookies cookies5 = new cookies(650, 200);
cookies cookies6 = new cookies(350, 200);
cookies cookies7 = new cookies(350, 300);
cookies cookies8 = new cookies(350, 100);
cookies cookies9 = new cookies(575, 375);
cookies cookies10 = new cookies(550, 400);
cookies cookies11 = new cookies(400, 50);
cookies cookies12 = new cookies(350, 375);
cookies cookies13 = new cookies(356, 250);
cookies cookies14 = new cookies(260, 360);
cookies cookies15 = new cookies(300, 200);
cookies cookies16 = new cookies(375, 350);
