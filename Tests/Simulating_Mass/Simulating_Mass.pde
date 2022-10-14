Mover judite;

void setup() {
  size(640, 640);
  pixelDensity(displayDensity());
  judite = new Mover();
}

void draw() {
  background(230);
  
  PVector gravity = new PVector(0, 0.1);
  judite.applyForce(gravity);
  PVector wind = new PVector(random(-0.1, 0.1), 0);
  judite.applyForce(wind);
  judite.update();
  judite.checkEdges();
  judite.render();
}
