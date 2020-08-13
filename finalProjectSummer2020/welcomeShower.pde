//intial welcome screen

void welcomeShower () {
  startScreen = loadImage ("desktop/pAndA/smartShower/welcomeShower.png");
  image (startScreen, 0, 0, width, height);

  if (mousePressed == true) { // tracking where the mouse is pressed
    if ((mouseX > 10) && (mouseX < 100) && (mouseY >15) && (mouseY < 75)) {
      showerState = "ABOUT";
    }
    else if ((mouseX < 10) || (mouseX > 100) || (mouseY < 15) || (mouseY > 75)) {
      showerState = "START";
    } 
  }
}
