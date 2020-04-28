Mover marina;

void setup() {
  pixelDensity(displayDensity());
  size(600, 600);
  marina = new Mover();
}

void draw() {
  background(200);
  marina.move();
  marina.render();
}
