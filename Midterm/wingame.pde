void winGame () {
  wingame = loadImage ("desktop/Tutoring/CrazeMaze/wingame.png");
  image (wingame, 0, 0, width, height);
  // click to play
  anothercookie();
  if (mousePressed == true) {
    score = 0;           // reverting to starting score
    gameState = "START";
  }
}
