float angle;
float vel;
float acc;

void setup() {
  size(600, 600);
  pixelDensity(displayDensity());
  angle = 0;
  vel = 0;
  acc = 0.0001;
}

void draw() {
  background(100);
  translate(width/2, height/2);
  rotate(angle);
  stroke(200);
  strokeWeight(2);
  line(-60, 0, 60, 0);
  noStroke();
  fill(200);
  ellipse(-60, 0, 16, 16);
  ellipse(60, 0, 16, 16);
  vel += acc;
  angle += vel;
}
