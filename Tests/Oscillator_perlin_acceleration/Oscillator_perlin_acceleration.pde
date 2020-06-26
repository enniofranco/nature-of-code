Oscillator[] bunch = new Oscillator[13];

void setup() {
  size(600, 600, FX2D);
  for(int i = 0; i < bunch.length; i++) {
    bunch[i] = new Oscillator(width/2, height/2);
  }
}

void draw() {
  background(200);
  for(int i = 0; i < bunch.length; i++) {
    bunch[i].update();
    bunch[i].render();
  }
}
