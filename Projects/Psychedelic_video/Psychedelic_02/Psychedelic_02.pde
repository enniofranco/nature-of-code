int screenW = 1080/2;
int screenH = 1080/2;
boolean isRecording;

MCQBColours mcqbColours;
ParticleClusterSystem particleClusterSystem;
Shape shape;

void settings() {
  size(screenW, screenH, FX2D);
  pixelDensity(displayDensity());
  //isRecording = true;
  isRecording = false;
}

void setup() {
  mcqbColours = new MCQBColours();
  particleClusterSystem = new ParticleClusterSystem(25);
  shape = new Shape();
}

void draw() {
  background(mcqbColours.cWhit);
  if(frameCount < 240) {
    fill(0);
    textSize(40);
    text("FUCK MY LIFE", 140, height/2);
  }
  if(frameCount > 80) {
    particleClusterSystem.go();
  }
  if (frameCount > 200) {
    shape.go();
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
