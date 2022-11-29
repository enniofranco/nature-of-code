Wave[] waves;
color black;
boolean isRecording;

void setup() {
  size(800, 800);
  pixelDensity(displayDensity());
  isRecording = false;
  black = #1A1A1A;

  waves = new Wave[2];
  for (int i = 0; i < waves.length; i++) {
    waves[i] = new Wave();
  }
}

void draw() {
  background(black);
  for (int i = 0; i < waves.length; i++) {
    waves[i].calculate();
    waves[i].render();
  }
  color red = #F00C29;
  fill(red);
  rectMode(CENTER);
  rect(width/2, height/2, 680, 10);

  if (isRecording) {
    saveFrame("PNG_export/GaussianWaves-####.png");
  }
}

void keyPressed() {
  if (key == 'r' || key == 'R') {
    isRecording = !isRecording;
  }
}
