//A simple Processing sketch of an 'analgogue digital clock'
//Binary hours, date and month on an analogue clock face
//Transparent red hour and minute hands with a red dot for seconds
//Sandra Woolley 05/11/2023

float secondsRadius;
float minutesRadius;
float hoursRadius;
float clockDiameter;

void setup() {
  fullScreen();
  stroke(255);
  textSize(height/20);
  strokeWeight(3);

  int radius = min(width, height) / 2;
  secondsRadius = radius * 0.75;
  minutesRadius = radius * 0.65;
  hoursRadius = radius * 0.5;
  clockDiameter = radius * 1.8;
}
void draw() {
  background(0);
  
  // Draw clock background
  fill(255);
  noStroke();
  translate(width/2, height/2);
  circle(0, 0, clockDiameter);
  float s = map(second(), 0, 60, 0, TWO_PI);
  float m = map(minute()+norm(second(), 0, 60), 0, 60, 0, TWO_PI);
  float h = map(hour()+norm(minute(), 0, 60), 0, 24, 0, TWO_PI*2);
  fill(0);
  text("KEELE", 0, height/5);
  text(binary(day(), 5)+"/"+ binary(month(), 4), 0, height/4);

  //Draw the second dot
  strokeWeight(height/10);
  pushMatrix();
  rotate(s);
  fill(255, 0, 0);
  circle(0, -secondsRadius, height/35);
  popMatrix();

  //Draw the hands of the clock
  fill(0);
  pushMatrix();
  rotate(m);
  strokeWeight(width/50);
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
