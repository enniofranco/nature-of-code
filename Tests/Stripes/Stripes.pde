Node stripe;
PVector pos;
PVector amplitude;

void setup() {
  size(600, 600);
  frameRate(30);
  stripe = new Node();
  //stripe = new Node(pos, amplitude, );
}

void draw() {
  background(200);
  stripe.update();
  stripe.render();
}
