//In this version I'm using the radius on the 2D NOISE space
//I shrink the radius therefore I use less noise dimensions
//The animation is not in loop yet

int screenW = 1080/2;
int screenH = 1080/2;
float ringSegments;
float ringMax;
float radius;
float angle;
float noiseRadius;
float zoff;

void settings() {
  size(screenW, screenH, FX2D);
  //size(screenW, screenH);
  pixelDensity(displayDensity());
}

void setup() {
  ringSegments = 70;
  ringMax = 100;
  angle = 0;
  noiseRadius = 1;
  zoff = 0;
}

void draw() {
  background(255, 239, 10);
  stroke(26, 26, 26, 50);
  noFill();
  for (float j = 0; j < ringMax; j++) {
    beginShape();
    for (float i = 0; i < ringSegments; i ++) {
      float angleInc = TWO_PI / ringSegments;
      float xoff = map(cos(angle) * noiseRadius, -1, 1, 0, 1);
      float yoff = map(sin(angle) * noiseRadius, -1, 1, 0, 1);
      radius = map(noise(xoff, yoff, zoff), 0, 1, 1, 140);
      radius += j * 1.5;
      float x = radius * cos(angle) + width/2;
      float y = radius * sin(angle) + height/2;
      vertex(x, y);
      angle += angleInc;
      noiseRadius -= 0.00038;
    }
    endShape(CLOSE);
    angle = 0;
    
  }
  noiseRadius = 1;
  zoff += 0.01;
  //noLoop();
}
