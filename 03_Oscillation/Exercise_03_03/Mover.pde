class Mover {
  PVector pos;
  PVector vel;
  PVector acc;
  float mass;
  
  float angle;
  PVector forward;
  PVector turn;

  Mover(float _m) {
    pos = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    mass = _m;
    angle = 0;
  }

  void update() {
    checkEdges();
    vel.add(acc);
    vel.limit(10);
    pos.add(vel);
    acc.mult(0);
  }
  
  void applyForce(PVector _f) {
    PVector force = PVector.div(_f, mass);
    acc.add(force);
  }
  
  void forward() {
    forward = new PVector(0, -0.1);
    applyForce(forward);
  }
  
  void turnRight() {
    turn = new PVector(0.2, 0);
    applyForce(turn);
  }
  void turnLeft() {
    turn = new PVector(-0.2, 0);
    applyForce(turn);
  }

  void render() {
    angle = vel.heading();
    fill(100);
    noStroke();
    rectMode(CENTER);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(angle);
    rect(0, 0, 32, 16);
    popMatrix();
  }
  
  void checkEdges() {
    if (pos.x > width) {
      pos.x = 0;
    } else if (pos.x < 0) {
      pos.x = width;
    }
    if (pos.y > height) {
      pos.y = 0;
    } else if (pos.y < 0) {
      pos.y = height;
    }
  }
}
