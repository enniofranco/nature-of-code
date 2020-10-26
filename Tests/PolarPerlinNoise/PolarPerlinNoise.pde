int screenW = 1080/2;
int screenH = 1080/2;
float radius;
float noiseInc;
float noiseRadius;
float uoff;
float voff;

void settings() {
  size(screenW, screenH, FX2D);
  pixelDensity(displayDensity());
}

void setup() {
  noiseInc = PI/50;
  uoff = 0;
}

void draw() {
  float utemp = uoff;
  background(255, 239, 10);
  stroke(26, 26, 26, 50);
  //noFill();
  noiseRadius = 1;
  for (float j = 0; j < 120; j++) {
    if (j == 0) {
      fill(0, 184, 31);
    } else {
      noFill();
    }
    beginShape();
    for (float i = 0; i < TWO_PI; i += noiseInc) {
      float xoff = map(cos(i), -1, 1, 0, 1);
      float yoff = map(sin(i), -1, 1, 0, 1);
      radius = map(noise(xoff, yoff, utemp), 0, 1, 1, 140);
      radius += j;
      float x = radius * cos(i) + width/2;
      float y = radius * sin(i) + height/2;
      vertex(x, y);
    }
    endShape(CLOSE);
    utemp -= 0.01;
  }
  uoff += 0.01;
}
