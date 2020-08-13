// card about the smart shower

void aboutSmartShower () {
  aboutShower = loadImage ("desktop/pAndA/smartShower/aboutSmartShower.png");
  image (aboutShower, 0, 0, width, height);
  
  // tracking the area where the mouse is to indicate if "RETURN" text on the image is being pressed 
  if (mousePressed == true) { 
    if ((mouseX > 25) && (mouseX < 100) && (mouseY >630) && (mouseY < 690)) {
      showerState = "WELCOME"; // going back to the main screen
    }
    else if ((mouseX < 25) && (mouseX > 100) && (mouseY < 630) && (mouseY > 690)) {
      showerState = "START";
      countDownTimer1.start(); // starting the shower 
    }
  }
}
