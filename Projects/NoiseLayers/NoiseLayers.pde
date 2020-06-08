int screenW = 1080/2;
int screenH = 1080/2;

NodeMaster taskmaster;

void settings() {
  size(screenW, screenH, FX2D);
  pixelDensity(displayDensity());
}

void setup() {
  taskmaster = new NodeMaster(48, 48, 48, width/2, height/2);
}

void draw() {
  background(#041ce0);
  taskmaster.update();
}
