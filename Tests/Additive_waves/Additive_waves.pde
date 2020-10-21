//float xoff = 0;
float inc = 0.01;
float start = 0;

void setup() {
  size(600, 600);
}

void draw() {
  background(200);
  stroke(100);
  noFill();
  beginShape();
  float xoff = start;
  for (int x = 0; x < width; x++) {
    float n = map(sin(xoff), -1, 1, -10, 10);
    float s = map(cos(xoff), -1, 1, 0, height);
    float c = map(cos(xoff), -1, 1, -70, 70);
    float d = map(noise(xoff), 0, 1, -180, 180);
    float y = n + s + c +d;
    vertex(x, y);
    xoff += inc;
  }
  start += inc;
  endShape();
  //noLoop();
}
