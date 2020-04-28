Bouncer[] b = new Bouncer[57];

void setup() {
  size(600, 600);
  pixelDensity(displayDensity());
  for (int i = 0; i < b.length; i++) {
    b[i] = new Bouncer();
  }
}

void draw() {
  background(100);
  for (int i = 0; i < b.length; i++) {
    b[i].update();
    b[i].render();
  }
}
