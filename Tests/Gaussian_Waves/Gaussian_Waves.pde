Wave wave;
Wave master;

void setup() {
  size(800, 800);
  pixelDensity(displayDensity());
  
  wave = new Wave();
  master = new Wave();
  
}

void draw() {
  background(50);
  wave.calculate();
  wave.render();
  master.calculate();
  master.render();
}
