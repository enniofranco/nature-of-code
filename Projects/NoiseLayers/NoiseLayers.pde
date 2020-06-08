int screenW = 1080/2;
int screenH = 1080/2;

NodeMaster taskmaster1;

void settings() {
  size(screenW, screenH, FX2D);
  pixelDensity(displayDensity());
}

void setup() {
  taskmaster1 = new NodeMaster(48, 48, 100, width/2, height/2);
}

void draw() {
  background(#041ce0);
  taskmaster1.update();
}
