int screenW = 1080/2;
int screenH = 1080/2;
boolean isRecording;

NodeMaster taskmaster1;

void settings() {
  size(screenW, screenH, FX2D);
  pixelDensity(displayDensity());
  isRecording = false;
}

void setup() {
  //int scale = 4;
  taskmaster1 = new NodeMaster(24, 72, 44, width/2, height/2);
}

void draw() {
  background(#041ce0);
  taskmaster1.update();
  
  if (isRecording) {
    saveFrame("Export/frame-####.png");
  }
}

void keyPressed() {
  if (key == 'r' || key == 'R') {
    isRecording = !isRecording;
  }
}
