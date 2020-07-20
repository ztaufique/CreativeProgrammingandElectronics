void startGame () { // the first screen
  /*textAlign(CENTER);          // creating the title screen
  PFont f = createFont("COCOMILKRegular", 40);
  textFont(f, 40);
  fill(#174883);
  text("Welcome to Cookie CrazeMaze! Click anywhere to start", width/2, height/2 - 20);
  textSize (30);
  fill (#0f98dc);
  text ("Help Cookie Monster get his cookie.\n Grab the cookie to win!", width/2, height/2 + 20);
  */
  cookiecraze = loadImage ("desktop/Tutoring/CrazeMaze/CookieCrazeMaze.png");
     image (cookiecraze, 0, 0, width, height);
  // click to play
  if (mousePressed == true) {
    clearbackground ();
    gameState = "PLAY"; 
  }
  
}
