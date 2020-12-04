class ParticleSystem {
  ArrayList<Particle> particles;
  PVector acc;
  PVector vel;
  PVector pos;
  float mass;
  
  ParticleSystem() {
    particles = new ArrayList<Particle>();
    mass = 1;
    pos = new PVector(random(width), random(height));
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
  }
  
  void addParticle() {
    particles.add(new Particle(pos));
  }
  
  void applyForce(PVector _f) {
    for (Particle p : particles) {
      p.applyForce(_f);
    }
  }
  
  void applyAttractor(Attractor a) {
    for (Particle p : particles) {
      PVector force = a.attract(p);
      p.applyForce(force);
    }
    PVector force = a.attractSystem(pos, mass);
    force.div(mass);
    acc.add(force);
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);
    vel.limit(15);
    a.step();
  }
  
  void render() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
    //fill(0);
    //ellipse(pos.x, pos.y, 50, 50);
  }
}
