// moving boxes obstacle
class MovingBox { //
  float x, y, XSpeed, YSpeed;

  MovingBox (float xpos, float ypos) {
    x = xpos;
    y= ypos; 
    XSpeed = Xspeed;
    YSpeed = Yspeed;
  }
  void update () { //making the boxes move
    x += Xspeed;
    y += Yspeed;
  }
  void wallCollisions () { // checking for the wall
    if ( (x > 200) || (x < 0)) {
      Xspeed = -Xspeed;
    }
    if ( (y < 200) || (y > 600)) {
      Yspeed = -Yspeed;
    }
  }
  void Box () { //drawing the box
    fill (#174883);
    noStroke();
    rect (x, y, impossibleBox, impossibleBox);
  }
}
MovingBox myBox = new MovingBox (100, 200);
MovingBox myBox1= new MovingBox (150, 250);
MovingBox myBox2= new MovingBox (75, 300);
MovingBox myBox3= new MovingBox (125, 350);
MovingBox myBox4= new MovingBox (25, 400);
MovingBox myBox5 = new MovingBox (175, 450);
