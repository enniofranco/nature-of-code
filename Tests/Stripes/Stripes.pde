//Waves seem to go always in the same direction
//Must think of a different way to control it
Node[] stripe;
PVector amplitude;
PVector spacing;
int nodes;
int stripes;
float acceleration;
float t;
float zoff;

void setup() {
  size(600, 600);
  frameRate(30);
  t = 1000;
  zoff = 0;
  spacing = new PVector(0, 150);
  amplitude = new PVector(200, 100);
  nodes = 28;
  stripes = 40;
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
    acceleration = map(noise(t, zoff), 0, 1, -0.001, 0.001);
    println("i" + i + " = " + acceleration);
    stripe[i].render(acceleration);
    t += 0.001;
  }
  t = 0;
  zoff += 0.01;
}
