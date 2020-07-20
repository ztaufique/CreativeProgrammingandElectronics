void loseGame() {
  fill (0);
  clearbackground();
  textAlign(CENTER);          // creating the losing title screen
  PFont f = createFont("COCOMILKRegular", 40);
  textFont(f, 40);
  fill(#174883);
  text("Uh oh! You missed the cookies, and Cookie Monster is still hungry", width/2, height/2 - 20);
  textSize (30);
  fill (#0f98dc);
  text ("Try Again!", width/2, height/2 + 20);
 /*   if (mousePressed == true) {
      gameState = "START";
     } */
}
