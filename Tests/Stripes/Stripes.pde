Node stripe;
PVector pos;
PVector amplitude;
int nodes;
float acceleration;

void setup() {
  size(600, 600);
  frameRate(30);
  
  stripe = new Node();
  //stripe = new Node(pos, amplitude, nodes, acceleration);
}

void draw() {
  background(200);
  stripe.update();
  stripe.render();
}

void keyPressed() {
  if (key == 'w' || key == 'W') {
    stripe.acceleration += 0.001;
  } else {
    stripe.acceleration = 0;
  }
}
