float angle;
float angle2;
float radius;
float radius2;
PVector posIni;

void setup() {
  size(600, 600, FX2D);
  angle = 0;
  angle2 = 0;
  posIni = new PVector(width/2, height/2);
}

void draw() {
  background(100);
  noStroke();
  radius = map(sin(angle2), -1, 1, 150, 250);
  radius2 = map(sin(angle2+PI), -1, 1, 150, 250);
  float x = cos(angle) * radius + posIni.x;
  float y = sin(angle) * radius + posIni.x;
  float x1 = cos(angle) * radius2 + posIni.x;
  float y1 = sin(angle) * radius2 + posIni.x;
  fill(255, 100);
  ellipse(x, y, 16, 16);
  ellipse(x1, y1, 16, 16);
  angle += 0.04;
  angle2 += 0.09;
}
