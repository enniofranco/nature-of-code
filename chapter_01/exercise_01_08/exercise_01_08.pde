Mover b;

void setup() {
  size(800,800);
  b = new Mover();
}

void draw() {
  background(200);
  b.update();
  //b.checkEdges();
  b.display();
}
