Mover tamara;

void setup() {
  size(600, 600);
  pixelDensity(displayDensity());
  tamara = new Mover();
}

void draw() {
  background(100);
  tamara.update();
  tamara.render();
}
