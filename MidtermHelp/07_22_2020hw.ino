int lightState = 0; // stores the light value
int lastLightState = 10;
int originalLightState = 0;

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
  Serial.println (light);


  if (button == HIGH) {
    Serial.println ("Alarm Reset");
    originalLightState == lastLightState;
    digitalWrite (10, LOW);
    digitalWrite (11, LOW);
  } else if (light < 450) {
    Serial.println ("Intruder Present!");
    digitalWrite (10, HIGH);
    digitalWrite(11, HIGH);
    lightState = lastLightState;
  } else if (light > 450) {
    Serial.println ("No Intruder");
    digitalWrite (10, LOW);
    digitalWrite (11, LOW);
    lightState == originalLightState;
  }
  if (lightState == lastLightState) {
    digitalWrite (10, HIGH);
    digitalWrite(11, HIGH);
  }

  if (button == HIGH) {
    originalLightState == lastLightState;
  }

  if (lightState == originalLightState)
  { Serial.println ("No Intruder");
    digitalWrite (10, LOW);
    digitalWrite (11, LOW);
  }

}
