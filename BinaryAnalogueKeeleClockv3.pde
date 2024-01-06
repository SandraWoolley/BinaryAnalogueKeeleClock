//A simple Processing sketch of an 'analgogue digital clock'
//Binary hours, date and month on an analogue clock face
//Transparent red hour and minute hands with a red dot for seconds

//v3 changes: rearrangement of text ("Keele" and date)
//Attempting to correct 'Ambient mode' issue with not updating second dot
//Colours inverted to remove Ambient mode flicker

//Sandra Woolley 06/01/2024

float secondsRadius;
float minutesRadius;
float hoursRadius;
float clockDiameter;

void setup() {
  fullScreen();
  stroke(255);
  textSize(height/15);
  strokeWeight(4);

  int radius = min(width, height) / 2;
  secondsRadius = radius * 0.72;
  minutesRadius = radius * 0.62;
  hoursRadius = radius * 0.45;
  clockDiameter = radius * 1.8;
}
void draw() {
  // Draw clock background
  background(0);
  noStroke();
  translate(width/2, height/2);
  float s = map(second(), 0, 60, 0, TWO_PI);
  float m = map(minute()+norm(second(), 0, 60), 0, 60, 0, TWO_PI);
  float h = map(hour()+norm(minute(), 0, 60), 0, 24, 0, TWO_PI*2);
  fill(255);
  text("KEELE", 0, -height/6);
  text(binary(day(), 5)+"/", 0, height/6);
  text(binary(month(), 4), 0, height/4.5);
  //Draw the second dot
  if (wearInteractive()) { //attempting to pause second dot when clock face in Ambient mode
    strokeWeight(height/10);
    pushMatrix();
    rotate(s);
    fill(255, 0, 0);
    circle(0, -secondsRadius, height/25);
    popMatrix();
  }

  //Draw the hands of the clock
  fill(255);
  pushMatrix();
  rotate(m);
  strokeWeight(width/40);
  stroke(255, 0, 0, 128);
  line(0, 0, 0, -minutesRadius);
  popMatrix();

  pushMatrix();
  rotate(h);
  line(0, 0, 0, -hoursRadius);
  popMatrix();

  //Draw hours on the clock face
  float angle=TWO_PI/12;
  rotate(angle);
  for (int i = 1; i < 13; i++) {
    textAlign(CENTER, CENTER);
    text(binary(i, 4), 0, -secondsRadius*1.15);
    rotate(angle);
  }
}
