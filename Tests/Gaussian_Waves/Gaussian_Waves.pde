Wave[] waves;

void setup() {
  size(800, 800);
  pixelDensity(displayDensity());

  waves = new Wave[2];
  for (int i = 0; i < waves.length; i++) {
    waves[i] = new Wave();
  }
}

void draw() {
  background(50);
  for (int i = 0; i < waves.length; i++) {
    waves[i].calculate();
    waves[i].render();
  }
}
