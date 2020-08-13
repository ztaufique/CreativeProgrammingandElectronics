// creating a class for the timer

class Timer { 
  int startTime;
  int interval;

  Timer (int timeInterval) {
    interval = timeInterval; // creating a variable for the time
  }

  void start () {
    startTime = millis ();
  }

  boolean complete () {
    int elapsedTime = millis () - startTime; // the time that is reflected is the millis ()
    if (elapsedTime > interval) { // must be greater than 0
      return true;
    } else { 
      return false;
    }
  }
}
