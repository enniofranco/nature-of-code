Mover[] tamara;

void setup() {
  size(600, 600);
  pixelDensity(displayDensity());
  tamara = new Mover[20];
  for (int i = 0; i < tamara.length; i++) {
    tamara[i] = new Mover();
  }
}

void draw() {
  background(100);
  for (int i = 0; i < tamara.length; i++) {
    tamara[i].update();
    tamara[i].render();
  }
}
