ParticleSystem ps;

void setup() {
  size(600, 600);
  ps = new ParticleSystem();
}

void draw() {
  background(200);
  
  PVector gravity = new PVector(0, 0.05);
  ps.applyForce(gravity);
  
  if (mousePressed) {
    PVector wind = new PVector(0.1, 0);
    ps.applyForce(wind);
  }
  
  ps.addParticle();
  ps.run();
}
