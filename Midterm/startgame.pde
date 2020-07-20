void startGame () { // the first screen
  cookiecraze = loadImage ("desktop/Tutoring/CrazeMaze/CookieCrazeMaze.png");
  image (cookiecraze, 0, 0, width, height);
  // click to play
  anothercookie();
}


void anothercookie () { //mousePressed to play
  cookie = loadImage ("desktop/Tutoring/CrazeMaze/cookie.png");
  image (cookie, 30, 50, 60, 60);
  if (mousePressed == true) {
    clearbackground ();
    score = 0;  
    gameState = "PLAY";
  }
}
