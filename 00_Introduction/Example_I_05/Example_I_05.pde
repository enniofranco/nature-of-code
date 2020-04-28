Walker salomao;

void setup() {
  pixelDensity(displayDensity());
  size(600, 600);
  salomao = new Walker();
}

void draw() {
  background(200);
  salomao.step();
  salomao.render();
}
