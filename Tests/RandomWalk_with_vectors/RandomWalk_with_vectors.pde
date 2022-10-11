Walker johnny;
Walker martha;

void setup() {
  size(800, 800);
  pixelDensity(displayDensity());
  johnny = new Walker();
  martha = new Walker();
}

void draw() {
  fill(220, 20);
  rect(0, 0, width, height);
  johnny.calculate();
  johnny.render();
  martha.calculate();
  martha.render();
}
