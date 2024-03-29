Mover[] caralhas;

void setup() {
  size(640, 640);
  pixelDensity(displayDensity());
  caralhas = new Mover[5];
  for (int i = 0; i < caralhas.length; i++) {
    caralhas[i] = new Mover();
  }
}

void draw() {
  background(230);

  for (Mover m : caralhas) {

    PVector gravity = new PVector(0, 0.2);
    gravity.mult(m.mass); //a little cheat to make gravity work
    m.applyForce(gravity);
    
    PVector wind = new PVector(0.2, 0);
    m.applyForce(wind);
    
    m.update();
    m.checkEdges();
    m.render();
  }
}
