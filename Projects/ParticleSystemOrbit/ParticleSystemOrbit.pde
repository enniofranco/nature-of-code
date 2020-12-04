int screenW = 1080/2;
int screenH = 1080/2;
boolean isRecording;

ParticleSystem ps;
Attractor attractor;

void settings() {
  size(screenW, screenH, FX2D);
  pixelDensity(displayDensity());
  isRecording = false;
}

void setup() {
  ps = new ParticleSystem();
  attractor = new Attractor(width/2 -20, height/2);
}

void draw() {
  background(245, 245, 238);

  ps.addParticle();

  //PVector gravity = new PVector(0, 0.1);
  //ps.applyForce(gravity);

  ps.applyAttractor(attractor);

  attractor.display();
  ps.render();

  if (isRecording) {
    saveFrame("Export/orbit-####.png");
  }
}

void keyPressed() {
  if (key == 'r' || key == 'R') {
    isRecording = !isRecording;
  }
}
