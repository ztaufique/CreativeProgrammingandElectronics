color gray; // blue of the background
color blue = color (#174883); // blue of the maze
boolean backgroundcolor = false;


void playGame () { // game
    maze ();
   // initial color tracking for game winning and losing

    loadPixels();
    
    color trackColor;
      trackColor = color (#EBEBEB);
    float worldRecord = 600; 
    
    int closestX = x; // x, y coordinates to make detections
    int closestY = y; 
    
    
    // loop to walk through the pixels
   for (int x = 0;  x < width; x ++) {
      for (int y = 0; y < height; y ++) {
        int loc = x + y*width;
        
    // figuring out the colors
    color currentColor = pixels [loc]; // determined from a computer vision tutorial https://www.youtube.com/watch?v=h8tk0hmWB44
      float r1 = red (currentColor);
      float g1 = green (currentColor);
      float b1 = blue (currentColor);
      float r2 = red (trackColor);
      float g2 = green (trackColor);
      float b2 = blue (trackColor);
      
    float d = dist (r1, g1, b1, r2, g2, b2); // using distance formula to compare colors 
    
    if (d < worldRecord) { // the game goest straight the the lose gameState at this point. How can I make it be directed by the mouse?
      d = worldRecord;
      closestX = x;
      closestY = y;    }
     }

    if (worldRecord < 10) {  
      gameState = "LOSE";
    } 


void maze () { // drawing the maze and creating the cursor
   strokeWeight (4);
   strokeJoin (ROUND);
   stroke(#174883);
  //maze 
     line (200, 0 , 200, 200); // entrance box
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
// cookie monster cursor   
    cookiemonster = loadImage ("desktop/Tutoring/CrazeMaze/cookiemonster.png");
     image (cookiemonster, mouseX, mouseY, 40, 40);
    
 
}
