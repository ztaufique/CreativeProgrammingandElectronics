// to end the shower, initiates the Arduino to turn the shower off

void endShower () {
  endShowerImage = loadImage ("desktop/pAndA/smartShower/endShower.png");
  image (endShowerImage, 0, 0, width, height);
  
  // tracking if the "RETURN" part of the image if being pressed
  if (mousePressed == true) {
    if ((mouseX > 10) && (mouseX < 100) && (mouseY >15) && (mouseY < 75)) {
      showerState = "WELCOME"; // returns to the original image
    }
  }
}
