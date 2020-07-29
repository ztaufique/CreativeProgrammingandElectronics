void startGame () { // the first screen
  // original image cookiecraze = loadImage ("desktop/Tutoring/CrazeMaze/CookieCrazeMaze.png");
  cookiecraze = loadImage ("desktop/Tutoring/CrazeMaze/cookieCraze2.png");
  image (cookiecraze, 0, 0, width, height);
  // click to play
  anothercookie();
}


void anothercookie () { //mousePressed to play
  cookie = loadImage ("desktop/Tutoring/CrazeMaze/cookie.png");
  image (cookie, 30, 50, 60, 60);
  if (myPort.available () > 0) { // if the value is available
    if ( ( value = myPort.readStringUntil (ENTER)) != null) value = trim (value);
    else return;
    if (value != null) {
      println (value);
      clearbackground ();
      score = 0;  
      gameState = "PLAY";
    }
  }
}


  /* this is where I made the change from Processing to using Arduino
   if (mousePressed == true) {
   clearbackground ();
   score = 0;  
   gameState = "PLAY";
   }
   */
