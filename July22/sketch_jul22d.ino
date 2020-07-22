// For this assignment, I wanted to integrate the idea of a home alarm and sensors


int lightState = 0; // stores the light value
int newLightState = 10;

void setup() {
  // setup code here, to run once:
  Serial.begin (4800);
  pinMode (11, OUTPUT);
  pinMode (10, OUTPUT);
  pinMode(A2, INPUT);
  pinMode(A1, INPUT);

}

void loop() {
  // main code here, to run repeatedly:

  int button = digitalRead(A2);
  int light = analogRead (A1);
  //Serial.println (light);


  if (button == HIGH) {
    Serial.println ("Welcome to your home alarm system"); // by pressing the button, you "activate" you're alarm system
    digitalWrite (10, HIGH);
    digitalWrite (11, HIGH);
    lightState = newLightState;
  } 
  if (light < 450) {
    Serial.println ("Intruder Present!");
    digitalWrite (10, HIGH);
    digitalWrite(11, HIGH);
   // lightState = lastLightState;
  } else if (light > 450) { // using lights to detect if there is an intruder in your home.
    Serial.println ("No Intruder");
    digitalWrite (10, LOW);
    digitalWrite (11, LOW);
  }
 if (lightState == newLightState) { // to keep the LED lights on so it shows that your alarm is working
    digitalWrite (10, HIGH);
    digitalWrite(11, HIGH);

  }



}
