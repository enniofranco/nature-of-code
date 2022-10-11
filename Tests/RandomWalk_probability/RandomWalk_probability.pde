Walker johnny;

void setup() {
  size(800, 800);
  pixelDensity(displayDensity());
  johnny = new Walker();
}

void draw() {
  fill(220, 2);
  rect(0, 0, width, height);
  johnny.calculate();
  johnny.render();
}
