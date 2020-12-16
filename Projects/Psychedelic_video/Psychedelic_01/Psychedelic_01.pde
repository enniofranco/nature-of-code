int screenW = 1080/2;
int screenH = 1080/2;
boolean isRecording;

MCQBColours mcqbColours;
Steps stepsA;
Steps stepsB;
int flag;

Mover[] movers = new Mover[50];
Attractor attractor;

void settings() {
  size(screenW, screenH, FX2D);
  pixelDensity(displayDensity());
}
void setup() {
  isRecording = false;

  mcqbColours = new MCQBColours();
  stepsA = new Steps(13);
  stepsB = new Steps(7);
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(1, 3), random(width/2-20, width/2+20), random(height/2-20, height/2+20));
  }
  flag = 0;
  attractor = new Attractor();
}

void draw() {
  background(mcqbColours.cRed_);
  float num = random(1);

  if (num < 0.05) {
    flag = int(random(2));
  }

  if (flag == 0) {
    stepsA.stepAnimationLoop();
  } else {
    stepsB.stepAnimationLoop();
  }

  attractor.drag();
  attractor.hover(mouseX, mouseY);
  attractor.render();

  for (int i = 0; i < movers.length; i++) {
    PVector force = attractor.attract(movers[i]);
    movers[i].applyForce(force);
    movers[i].update();
    movers[i].render();
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
