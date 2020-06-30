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
  
  void update() {
    pos.x = anchor.x;
    pos.y = cos(angle) * amplitude + anchor.y;
    angle += vel;
  }
  
  void render() {
    noStroke();
    fill(100);
    ellipse(pos.x, pos.y, 16, 16);
  }
}
