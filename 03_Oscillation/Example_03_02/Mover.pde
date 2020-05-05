class Mover {
  PVector pos;
  PVector vel;
  PVector acc;
  float mass;
  
  //ANGULAR MOTION
  float angle = 0;
  float angVel = 0;
  float angAcc = 0;
  
  Mover(float _m, float _x, float _y) {
    pos = new PVector(_x, _y);
    vel = new PVector(random(1), random(1));
    acc = new PVector(0, 0);
    mass = _m;
  }
  
  void update() {
    vel.add(acc);
    pos.add(vel);
    
    angAcc = acc.x / 10.0;
    
    angVel += angAcc;
    angVel = constrain(angVel, -0.1, 0.1);
    angle += angVel;
    
    acc.mult(0);
  }
  
  void render() {
    noStroke();
    fill(200, 150);
    rectMode(CENTER);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(angle);
    rect(0, 0, mass*16, mass*16);
    popMatrix();
  }
  
  void applyForce(PVector _f) {
    PVector force = PVector.div(_f, mass);
    acc.add(force);
  }
  
}
