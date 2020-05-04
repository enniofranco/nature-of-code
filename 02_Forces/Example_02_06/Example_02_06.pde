Mover m;
Attractor a;

void setup() {
  size(600, 600);
  pixelDensity(displayDensity());
  m = new Mover(1, 400, 200);
  a = new Attractor();
}

void draw() {
  background(100);
  PVector force = a.attract(m);
  m.applyForce(force);
  
  a.render();
  m.update();
  m.render();
}
