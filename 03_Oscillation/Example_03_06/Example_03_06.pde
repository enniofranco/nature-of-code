Oscillator[] mauricio;

void setup() {
  size(600, 600);
  pixelDensity(displayDensity());
  mauricio = new Oscillator[7];
  for (int i = 0; i < mauricio.length; i++) {
    mauricio[i] = new Oscillator();
  }
}

void draw() {
  background(200);
  for (int i = 0; i < mauricio.length; i++) {
    mauricio[i].oscillate();
    mauricio[i].render();
  }
}
