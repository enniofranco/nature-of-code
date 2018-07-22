Ball b;

void setup() {
  size(800,800);
  b = new Ball();
}

void draw() {
  background(200);
  b.move();
  b.bounce();
  b.display();
}
