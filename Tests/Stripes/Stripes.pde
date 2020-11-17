Stripe stripe;

void setup() {
  size(600, 600);
  frameRate(30);
  stripe = new Stripe();
}

void draw() {
  background(200);
  stripe.update();
  stripe.render();
}
