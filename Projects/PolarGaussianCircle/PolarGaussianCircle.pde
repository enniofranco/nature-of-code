int screenW = 1080/2;
int screenH = 1080/2;

ParticleSystem systemA;

void settings() {
  size(screenW, screenH, FX2D);
  pixelDensity(displayDensity());
}

void setup() {
  systemA = new ParticleSystem(width/2, height/2, 50, 100, 10, 16);
}

void draw() {
  background(26, 26, 26);
  systemA.render();
  
  //saveFrame("Export/polarcircle-####.png");

  noLoop();
}
