const int buttonPin = 2; //the pin that the button is attached to
int inByte = 0; //serial byte


void setup() {
  // intiaizing the communication
  Serial.begin (9600);
  //initializing the buttonPin as an input
  pinMode(buttonPin, INPUT);

}

void loop() {
  // send the value of the button
 int val = digitalRead(buttonPin);
  if (val == HIGH) { // using the button to restart the game
    Serial.available();
    Serial.println ("Game has restart!");
    delay (20);
  }
}
