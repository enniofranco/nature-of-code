/*
Perlin Noise has only 3 dimensions
I should try openSimplex noise

The shape doesn't close correctly
*/

int screenW = 1080/2;
int screenH = 1080/2;
float radius;
float noiseInc;
float noiseRadius;
float noiseZ;

void settings() {
  //size(screenW, screenH, FX2D);
  size(screenW, screenH);
  pixelDensity(displayDensity());
}

void setup() {
  noiseInc = PI/30;
  noiseZ = 0;
}

void draw() {
  background(200);
  noiseRadius = 1;
  //noStroke();
  //fill(100, 10);
  stroke(0,90);
  noFill();
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
    endShape();
    noiseZ += 0.01;
  }
  noiseZ = 0;
}
