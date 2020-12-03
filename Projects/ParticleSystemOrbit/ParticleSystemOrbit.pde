ParticleSystem ps;
Attractor attractor;

void setup() {
  size(600, 600);
  ps = new ParticleSystem(new PVector(width/2, 50));
  attractor = new Attractor(width/2 -20, height/2);
}

void draw() {
  background(255);
  
  ps.addParticle();
  
  PVector gravity = new PVector(0, 0.1);
  ps.applyForce(gravity);
  
  ps.applyAttractor(attractor);
  
  attractor.display();
  ps.render();
}
