float startAngle = 0;
float angleVel = 0.1;

void setup() {
  size(600, 600);
  pixelDensity(displayDensity());
}

void draw() {
  background(200);
  
  float angle = startAngle;
  
  for (int x = 0; x <= width; x += 24) {
    float y = map(sin(angle), -1, 1, 0, height);
    noStroke();
    fill(100, 150);
    ellipse(x, y, 48, 48);
    angle += angleVel;
  }
  startAngle += 0.007;
}
