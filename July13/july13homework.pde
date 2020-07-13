float r0=0;
float x;
float y;
float easing = 0.05; // for the delayed response for the fish to reach the mouse
long xTime = 0;
long yTime = 0;
boolean changeColor = false;
void setup() {
  size (600, 400);
  noStroke();
}
     
void draw() {
  background (#8BC2DB);
  waves();
  noStroke();
  fish(); 

  }

void fish () {
  float targetX = mouseX; // having the fish follow the mouse a distance away
  float dx = targetX - x;
  x += dx * easing;
  
  float targetY = mouseY;
  float dy = targetY - y;
  y += dy * easing;
  fill (#B0FF83); // drawing the fish
  bezier (254+x, 218+y, 21+x ,381+y, 14+x,149+y,260+x,244+y);
  
  for (int i = 0; i<width/2; i ++){ // fishfood @ mouse
     fill (#FAC286);
     ellipse (mouseX , mouseY, 6, 6);
  }
}
// Here I tried to make the background change colors and shift back and forth. However, the frame rate is way too short. This was my attempt at fixing it, but it caused the color of the fish food to be to short.
 void waves() {
  pushMatrix();
  // xTime = millis();
  //if (xTime-yTime > 1000) {
    fill (80, random (80,150), random (150,255));
  //  yTime = xTime;
  // changeColor = true; 
 
  /* if (changeColor) {
    fill (80, random (80,150), random (150,255));
    changeColor = false;
    yTime = xTime;
  } 
  */
  //pushMatrix();
  scale(2.0);
  arc (0, 400, 50.0+r0, 50.0+r0, radians (180), radians (360));
  r0 = r0 +20;
  popMatrix();

}
