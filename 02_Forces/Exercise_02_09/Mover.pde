class Mover {
  PVector pos;
  PVector vel;
  PVector acc;
  float mass;
  
  Mover(float _m, float _x, float _y) {
    pos = new PVector(_x, _y);
    vel = new PVector(random(3), 0);
    acc = new PVector(0, 0);
    mass = _m;
  }
  
  void update() {
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);
  }
  
  void render() {
    noStroke();
    fill(200);
    ellipse(pos.x, pos.y, mass * 16, mass * 16);
  }
  
  void applyForce(PVector _f) {
    PVector force = PVector.div(_f, mass);
    acc.add(force);
  }
  
}
