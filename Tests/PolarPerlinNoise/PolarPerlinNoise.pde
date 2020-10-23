int screenW = 1080/2;
int screenH = 1080/2;
float radius;
float noiseInc;
float noiseRadius;
float noiseZ;

void settings() {
  size(screenW, screenH, FX2D);
  //size(screenW, screenH);
  pixelDensity(displayDensity());
}

void setup() {
  noiseInc = PI/50;
  noiseZ = 0;
}

void draw() {
  background(255, 239, 10);
  stroke(26, 26, 26, 50);
  noFill();
  noiseRadius = 1;
  for (float j = 0; j < 120; j++) {
    beginShape();
    for (float i = 0; i < TWO_PI; i += noiseInc) {
      float xoff = map(cos(i), -1, 1, 0, 1);
      float yoff = map(sin(i), -1, 1, 0, 1);
      radius = map(noise(xoff, yoff, noiseZ), 0, 1, 10, 180);
      radius += j;
      float x = radius * cos(i) + width/2;
      float y = radius * sin(i) + height/2;
      vertex(x, y);
    }
    endShape(CLOSE);
    noiseZ += 0.01;
  }
  noiseZ = 0;
}
