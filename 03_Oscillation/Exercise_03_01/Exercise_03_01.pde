float angle = 0;

void setup() {
  size(600, 600);
  pixelDensity(displayDensity());
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
  angle += 0.06;
}
