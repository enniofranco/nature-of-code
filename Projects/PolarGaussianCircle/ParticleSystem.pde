class ParticleSystem {
  Particle[][] particle;
  int particleNumber;
  float angle;
  float standardDeviation;
  float radius;
  int ringsNumber;
  float particleSize;

  ParticleSystem(float _x, float _y, float _radius, int _particleNumber, int _ringsNumber, float _particleSize) {
    particleNumber = _particleNumber;
    ringsNumber = _ringsNumber;
    standardDeviation = PI/3;
    radius = _radius;
    particleSize = _particleSize;
    particle = new Particle[ringsNumber][particleNumber];
    for (int i = 0; i < ringsNumber; i++) {
      for (int j = 0; j < particleNumber; j++) {
        angle = randomGaussian() * standardDeviation;
        particle[i][j] = new Particle(_x, _y, angle, radius, particleSize);
      }
      radius += particleSize;
    }
  }

  void render() {
    for (int i = 0; i < ringsNumber; i++) {
      for (int j = 0; j < particleNumber; j++) {
        particle[i][j].update();
        particle[i][j].render();
      }
    }
  }
}
