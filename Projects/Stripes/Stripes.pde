int screenW = 1080/2;
int screenH = 1080/2;
boolean isRecording;

Node[] stripe;
PVector amplitude;
PVector spacing;
int nodes;
int stripes;
float acceleration;
float t;

void settings() {
  size(screenW, screenH);
  pixelDensity(displayDensity());
  isRecording = false;
}

void setup() {
  t = 0;
  spacing = new PVector(0, 150);
  amplitude = new PVector(120, 50);
  nodes = 16;
  stripes = 38;
  acceleration = 0;

  stripe = new Node[stripes];
  for (int i = 0; i < stripes; i++) {
    PVector posi = new PVector(width/2, i * 16);
    stripe[i] = new Node(posi, amplitude, nodes);
  }
}

void draw() {
  background(245, 245, 238);
  for (int i = 0; i < stripes; i++) {
    stripe[i].render();
  }

  if (isRecording) {
    saveFrame("Export/stripes-####.png");
  }
}

void keyPressed() {

  if (key == 'r' || key == 'R') {
    isRecording = !isRecording;
  }

  if (key == '1') {
    t = 5;
    for (int i = 0; i < stripes; i++) {
      acceleration = map(noise(t), 0, 1, 0, 0.002);
      stripe[i].setAcceleration(acceleration);
      t += 0.01;
    }
    t = 5;
  } else if (key == '2') {
    t = 5.001;
    for (int i = 0; i < stripes; i++) {
      acceleration = map(noise(t), 0, 1, 0, -0.002);
      stripe[i].setAcceleration(acceleration);
      t += 0.01;
    }
    t = 5.001;
  }
}
