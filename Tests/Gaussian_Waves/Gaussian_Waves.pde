Wave[] waves;
color bgColor;

void setup() {
  size(800, 800);
  pixelDensity(displayDensity());

  waves = new Wave[2];
  for (int i = 0; i < waves.length; i++) {
    waves[i] = new Wave();
  }
  bgColor = #1A1A1A;
}

void draw() {
  background(bgColor);
  for (int i = 0; i < waves.length; i++) {
    waves[i].calculate();
    waves[i].render();
  }
}
