int screenW = 1080/2;
int screenH = 1080/2;

NodeMaster taskmaster;

void settings() {
  size(screenW, screenH, FX2D);
  pixelDensity(displayDensity());
}

void setup() {
  taskmaster = new NodeMaster();
}

void draw() {
  background(200);
  taskmaster.update();
}
