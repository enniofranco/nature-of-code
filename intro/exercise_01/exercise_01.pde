//As seen on video I.1: Random Walker - The Nature of Code

Walker w;

void setup() {
  size (800,800);
  w = new Walker();
  background(255);
}

void draw() {
  w.step();
  w.render();
}
