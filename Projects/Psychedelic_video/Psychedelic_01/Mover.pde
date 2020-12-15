class Mover {
  PVector pos;
  PVector vel;
  PVector acc;
  float mass;
  
  MCQBColours mcqbColours;
  
  Mover(float _m, float _x, float _y) {
    mcqbColours = new MCQBColours();
    pos = new PVector(_x, _y);
    vel = new PVector(random(1), random(1));
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
    fill(mcqbColours.cBlue);
    ellipse(pos.x, pos.y, 12*mass, 12*mass);
  }
  
  void applyForce(PVector _f) {
    PVector force = PVector.div(_f, mass);
    acc.add(force);
  }
  
}
