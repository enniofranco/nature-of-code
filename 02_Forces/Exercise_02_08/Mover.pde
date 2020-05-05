class Mover {
  PVector pos;
  PVector vel;
  PVector acc;
  float mass;
  
  Mover(float _m, float _x, float _y, float _sx, float _sy) {
    pos = new PVector(_x, _y);
    vel = new PVector(_sx, _sy);
    acc = new PVector(0, 0);
    mass = _m;
  }
  
  void update() {
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);
  }
  
  void render() {
    stroke(0, 100);
    //fill(200);
    point(pos.x, pos.y);
    //ellipse(pos.x, pos.y, 16, 16);
  }
  
  void applyForce(PVector _f) {
    PVector force = PVector.div(_f, mass);
    acc.add(force);
  }
  
}
