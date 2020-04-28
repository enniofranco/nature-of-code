Walker bunda;

void setup() {
  pixelDensity(displayDensity());
  size(600, 600);
  bunda = new Walker();
}

void draw() {
  background(100);
  bunda.step();
  bunda.render();
}
