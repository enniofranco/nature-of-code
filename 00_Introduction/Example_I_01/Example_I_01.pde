Walker mariah;

void setup() {
  pixelDensity(displayDensity());
  size(600, 600);
  mariah = new Walker();
  background(100);
}

void draw() {
  mariah.step();
  mariah.render();
}
