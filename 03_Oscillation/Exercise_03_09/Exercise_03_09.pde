float startAngle = 0;
float angleVel = 0.05;

void setup() {
  size(600, 600);
}

void draw() {
  background(255);

  //[full] In order to move the wave, we start at a different theta value each frame.
  float angle = startAngle;
  //[end]

  for (int x = 0; x <= width; x += 24) {
    float y = map(noise(angle), 0, 1, 0, height);
    stroke(0);
    fill(0, 50);
    ellipse(x, y, 48, 48);
    angle += angleVel;
  }
  startAngle += 0.01;
}
