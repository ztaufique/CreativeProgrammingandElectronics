/* Zarah Taufique - 08/03/2020 Assignment
 
 For this assignment, I wanted to take inspiration from Zach Lieberman's work and try to make it my own. 
 I was inspired by his use varying of motion, so I wanted to use Perlin noise to show a waving landscape.
 
 
 I made this with the help of Coding Train's video https://www.youtube.com/watch?v=IKB1hWWedMk
 */


int cols, rows;
int scl = 20;
int w = 1200;
int h = 900;
float flying = 0;
float [][] landscape;

long previousTime = 0;
long currentTime = 0;
boolean changeColor = false;

void setup() {
  size (600, 600, P3D); // using the 3D feature in Processing for the motion variation 
  cols = w/ scl;
  rows = h/ scl;
  landscape = new float [cols][rows]; // initiallizing the array, this ensure the randomness of the rows and columns
}

void draw() {

  flying -= 0.02; // changes the speed of the movement

  float yoff = flying;
  for (int y= 0; y < rows; y ++) { // by increasing the y value by one, it created the vertcal lines
    float xoff = 0; // creates the horizontal lines
    for  (int x = 0; x < cols; x ++ ) {
      landscape [x][y] = map(noise (xoff, yoff), 0, 1, -150, 150); // using perlin noise to make the movement of the landscape smooth
      xoff += 0.1; // changes the x-coordinate in the noise space
    }
    yoff += 0.1; // changes the y-coordinate in the noise space
  }


  background(0); // background
  fill (0);

  currentTime = millis (); // tracking the color change of the stroke colors 
  if  (currentTime - previousTime > 700) { // randomly picks the stroke color, but ensuring that it is not too fast
    changeColor = true;
  }

  if (changeColor) { 

    stroke (random(255), random (255), random (255));
    changeColor = false; 
    previousTime = currentTime;
  }


  translate (width/2, height/2);
  translate (-w/2, - h/2);

  for (int y= 0; y < rows - 1; y ++) { // making the intersecting triangles in the plane
    beginShape (TRIANGLE_STRIP); // using the shapes to create many intersecting triangles
    for  (int x = 0; x < cols; x ++ ) { 
      vertex (x*scl, y*scl, landscape[x][y]); // the vertices create the strips, the landscape array is used to ensure that each column and row has a triangle strip
      vertex (x*scl, (y+1)*scl, landscape [x] [y+1]);
    }
    endShape();
  }
}
