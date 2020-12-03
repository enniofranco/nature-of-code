ParticleSystem ps;

void setup() {
  size(600, 600);
  ps = new ParticleSystem();
}

void draw() {
  background(200);
  ps.addParticle();
  ps.run();
}
