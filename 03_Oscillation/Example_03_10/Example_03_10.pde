Pendulum p;

void setup() {
  size(600, 600);
  pixelDensity(displayDensity());
  p = new Pendulum(new PVector(width/2, 10), 125);
}

void draw() {
  background(200);
  p.go();
}
