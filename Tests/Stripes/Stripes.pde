//Waves seem to go always in the same direction
//Must think of a different way to control it
Node[] stripe;
PVector amplitude;
PVector spacing;
int nodes;
int stripes;
float acceleration;
float t;

void setup() {
  size(600, 600, FX2D);
  //frameRate(30);
  t = 0;
  spacing = new PVector(0, 150);
  amplitude = new PVector(100, 50);
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
  background(200);
  for (int i = 0; i < stripes; i++) {
    stripe[i].render();
  }
}

void keyPressed() {
  if (key == '1') {
    t = 5;
    for (int i = 0; i < stripes; i++) {
      acceleration = map(noise(t), 0, 1, 0, 0.002);
      stripe[i].setAcceleration(acceleration);
      t += 0.02;
    }
    t = 5;
  } else if (key == '2') {
    t = 5.001;
    for (int i = 0; i < stripes; i++) {
      acceleration = map(noise(t), 0, 1, 0, -0.002);
      stripe[i].setAcceleration(acceleration);
      t += 0.02;
    }
    t = 5.001;
  }
}
