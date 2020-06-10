int screenW = 1080/2;
int screenH = 1080/2;
boolean isRecording;

float noiseScale = 0.02;
PVector colour1, colour2;

void settings() {
  size(screenW, screenH, FX2D);
  pixelDensity(displayDensity());
  isRecording = false;
}

void setup() {
  colour1 = new PVector(255, 10, 79);
  colour2 = new PVector(26, 26, 26);
}

void draw() {
  background(#ffef0a);
  for (int y = 30; y < height; y++) {
    for (int x = 0; x < width; x++) {
      float noiseVal = noise(x*noiseScale, y*noiseScale);
      float _R, _G, _B;
      _R = map (noiseVal, 0, 1, colour1.x, colour2.x);
      _G = map (noiseVal, 0, 1, colour1.y, colour2.y);
      _B = map (noiseVal, 0, 1, colour1.z, colour2.z);
      stroke(_R, _G, _B);
      line(x, y+noiseVal*80, x, height);
    }
  }
  
  if (isRecording) {
    saveFrame("Export/frame-####.png");
  }
}

void keyPressed() {
  if (key == 'r' || key == 'R') {
    isRecording = !isRecording;
  }
}
