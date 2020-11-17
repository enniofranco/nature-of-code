Node stripe;
PVector pos;
PVector amplitude;
int nodes;
float acceleration;
float t;

void setup() {
  size(600, 600);
  frameRate(30);
  t = 1000;
  
  pos = new PVector(width/2, height/2);
  amplitude = new PVector(200, 0);
  nodes = 28;
  
  stripe = new Node(pos, amplitude, nodes);
  acceleration = 0;
}

void draw() {
  acceleration = map(noise(t), 0, 1, -0.001, 0.001); 
  background(200);
  stripe.render(acceleration);
  t += 0.001;
}
