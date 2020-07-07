float r0 = 0;

void setup() {
    size (500, 500);
    background (255, 240, 240);
}

void draw() {
// mirror
    strokeWeight (1);
    fill (219, 237, 255);
    rect (-15, 75, 525, 125);
    // top row of scalloping
    fill (255, 212,100);
    arc (r0, 75.0, 50.0, 50.0, radians (180), radians (360));
      r0 = r0 +20;
    // bottom row of scalloping
    arc (r0, 200.0, 50.0, 50.0, radians (0), radians (180));
      r0 = r0+20;
    // lines in mirror
    line (90, 120, 80, 150);
    line (50, 100, 40, 130);
    line (140, 150, 130, 180);
    line (250, 100, 240, 130);
    line (400, 120, 390, 150);
    line (450, 360, 440, 390);
    line (330, 150, 320, 180);
      
// sofa
    fill (209, 60, 55);
    rect (225, 250, 100, 75);
    rect (330, 250, 100, 75);
    rect (225, 330, 100, 25);
    rect (330, 330, 100, 25);
    rect (220, 365, 215, 25);
    rect (200, 300, 20, 90);
    rect (435, 300, 20, 90);
    
    
// rug 
    fill (178, 46, 41);
    ellipse(250, 425, 500, 50); 

// me
    fill (54, 28, 4); // hair
    ellipse (75, 285, 70, 90);
    fill (206, 150,90); // face
    ellipse(75, 275, 50, 50);
    fill (62, 131,40); // dress
    triangle (75, 300, 50, 370, 100, 370);
    
    strokeWeight (2);
    line (60, 370, 60, 410); // legs
    line (90, 370, 90, 410);
    line (60, 410, 50, 410);
    line (90, 410, 100, 410);
    
    line (60, 340, 40, 330); // arms
    line (90, 340, 110, 330);
    
    line (69, 265, 69, 270); // face
    line (83, 265, 83, 270);
    fill (206, 150,90);
    arc (75, 283, 20, 20, radians (0), radians (180));

}
