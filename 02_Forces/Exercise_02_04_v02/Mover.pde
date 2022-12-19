class Mover {
  PVector loc;
  PVector vel;
  PVector acc;
  float mass;
  float moverSize;

  Mover(float mass_, float x_, float y_) {
    loc = new PVector(x_, y_);
    vel = new PVector(0, 0);
    acc  = new PVector(0, 0);
    mass = mass_;
    moverSize = mass * 8;
  }
  
  void applyForce(PVector _f) {
    PVector f = PVector.div(_f, mass);
    acc.add(f);
  }
  
  void update() {
    vel.add(acc);
    loc.add(vel);
    acc.mult(0);
  }
  
  void render() {
    noStroke();
    fill(200, 200);
    ellipse(loc.x, loc.y, moverSize, moverSize);
  }
  
  boolean isInside (FrictionField f_) {
    if (loc.x >= f_.x && loc.x <= f_.x + f_.w && loc.y >= f_.y && loc.y <= f_.y + f_.h) {
      return true;
    } else {
      return false;
    }
  }
  
  void applyFriction(FrictionField f_) {
    PVector friction = vel.copy();
    friction.mult(-1);
    friction.normalize();
    friction.mult(f_.c);
    applyForce(friction);
  }
  
  void checkEdges() {
    if (loc.x < 0) {
      loc.x = 0;
      vel.x *= -1;
    } else if (loc.x > width) {
      loc.x = width;
      vel.x *= -1;
    }
    
    if (loc.y > height) {
      loc.y = height;
      vel.y *= -1;
    }
  }
}
