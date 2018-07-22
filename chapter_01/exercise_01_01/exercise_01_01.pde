Walker w;

void setup() {
  size(800,800);
  w = new Walker();
}

void draw() {
  background(200);
  w.step();
  w.display();
}
