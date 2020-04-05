RandomWalker r;

void setup() {
  background(26, 25, 24);
  r = new RandomWalker();
  size(800, 800);
}

void draw() {
  r.update();
  r.render();
}
