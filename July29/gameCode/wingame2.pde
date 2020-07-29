void winGame () {
  // original image wingame = loadImage ("desktop/Tutoring/CrazeMaze/wingame.png");
  wingame = loadImage ("desktop/Tutoring/CrazeMaze/winGame2.png");
  image (wingame, 0, 0, width, height);
  // click to play
  anothercookie();
  if (mousePressed == true) {
    score = 0;           // reverting to starting score
    gameState = "START";
  }
}
