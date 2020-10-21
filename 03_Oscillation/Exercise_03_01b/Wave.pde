class Wave {
  float theta;
  float vel;
  float gap;
  
  Wave(float _x, float _y, float _nparticle) {
    theta = 0;
    vel = 0.2;
    gap = 6;
    for(int i=0; i < _nparticle; i++) {
      Particle particle = new Particle(_x + (i*gap), _y, theta, vel, 200);
    }
  }
}
