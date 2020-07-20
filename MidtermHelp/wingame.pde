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
