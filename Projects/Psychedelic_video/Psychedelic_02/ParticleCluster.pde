class ParticleCluster {
  Particle[] particles;
  int particleNumberOf;

  ParticleCluster(float _anchorX, float _anchorY) {
    particleNumberOf = int(random(3, 55));
    particles = new Particle[particleNumberOf];
    for (int i = 0; i < particleNumberOf; i++) { 
      particles[i] = new Particle(_anchorX, _anchorY);
    }
  }

  void go() {
    for (int i = 0; i < particleNumberOf; i++) {
      particles[i].step();
      particles[i].render();
    }
  }
}
