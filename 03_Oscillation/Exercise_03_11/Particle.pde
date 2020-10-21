class Particle {
  PVector pos;
  PVector anchor;
  float angle;
  float vel;
  float amplitude;
  
  Particle(float _x, float _y, float _angle, float _vel, float _amplitude) {
    pos = new PVector();
    anchor = new PVector(_x, _y);
    angle = _angle;
    vel = _vel;
    amplitude = _amplitude;
  }
  
  void updateCos() {
    float theta = angle;
    pos.x = anchor.x;
    pos.y = cos(theta) * amplitude + anchor.y;
    theta += vel;
  }
  
  void updateSin() {
    float theta = angle;
    pos.x = anchor.x;
    pos.y = sin(theta) * amplitude + anchor.y;
    theta += vel;
  }
  
  void render() {
    noStroke();
    fill(100, 100);
    ellipse(pos.x, pos.y, 16, 16);
  }
}
