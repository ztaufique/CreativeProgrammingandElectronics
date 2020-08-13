// for the running timer, initiates the Arduino to turn the shower on

void startShower () {
  arial1 = createFont ("ArialRoundedMTBold", 50);

  startAngle += 0.02;
  float angle = startAngle;

  for (int x = 0; x <= width; x += 24) {
    float y = map(sin(angle), -1, 1, 0, height); // using the sin function to create the wave effect of the background - makes it more smooth
    ellipse(x, y, 48, 48);
    angle += angelVel; // angle increases
    if ((timeLeft1 <= 420) && (timeLeft1 >= 300)) { // if the shower state is in a certain time, the color of the following balls change
      stroke(#C7CeeA);
      fill(#C7CeeA, 50); 
      textAlign (CENTER);
      textFont (arial1);
      text ("get wet!", 500, 500);
      
    } else if ((timeLeft1 <=  300) && (timeLeft1 >= 180)) { 
      stroke(#FF9AA2);
      fill(#FF9AA2, 50); 
      textAlign (CENTER);
      textFont (arial1);
      text ("time for soap!", 500, 500);
      
    } else if ((timeLeft1 <=  180) && (timeLeft1 >= 60)) { 
      stroke(#AFF8DB);
      fill(#AFF8DB, 50);
      textAlign (CENTER);
      textFont (arial1);
      text ("time for shampoo!", 500, 500);
      
    } else if ((timeLeft1 <= 60) && (timeLeft1 > 0)) { 
      stroke(#85E3FF);
      fill(#85E3FF, 50);
      textAlign (CENTER);
      textFont (arial1);
      text ("final rinse !", 500, 500);
    }
  }

// the timer for the shower
  arial = createFont ("ArialRoundedMTBold", 90);
  fill (#BC3333);
  // show the countDown
  String s = " TIME LEFT: " + timeLeft1;
  textAlign (CENTER);
  textFont (arial);
  fill (#c9c9ff);
  text (s, 500, 350);

  myPort.write (showerLoop); // initialzing the arduino withing the startShower state

  // timer logic

  if (countDownTimer1.complete () == true) {
    if (timeLeft1 > 0) { // timer decreases until zero; once it reaches zero, the shower state changes to finished
      timeLeft1 --;
      countDownTimer1.start ();
    } else {
      showerState = "DONE";
    }
  }
}
