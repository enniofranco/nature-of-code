class Vehicle {
  PVector pos;
  PVector vel;
  PVector acc;
  float r;
  float maxForce;
  float maxSpeed;
  
  Vehicle(float _x, float _y) {
    acc = new PVector(0, 0);
    vel = new PVector(0, -2);
    pos = new PVector(_x, _y);
    r = 6;
    maxSpeed = 4;
    maxForce = 0.1;
  }
  
  void update() {
    vel.add(acc);
    vel.limit(maxSpeed);
    pos.add(vel);
    acc.mult(0);
  }
  
  void applyForce(PVector _force) {
    acc.add(_force);
  }
  
  void seek(PVector _target) {
    PVector desired = PVector.sub(_target, pos);
    desired.setMag(maxSpeed);
    PVector steer = PVector.sub(desired, vel);
    steer.limit(maxForce);
    
    applyForce(steer);
  }
  
  void display() {
    float theta = vel.heading() + PI/2;
    fill(175);
    //stroke(0);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);
    beginShape();
    vertex(0, -r*2);
    vertex(-r, r*2);
    vertex(r, r*2);
    endShape(CLOSE);
    popMatrix();
  }
}
