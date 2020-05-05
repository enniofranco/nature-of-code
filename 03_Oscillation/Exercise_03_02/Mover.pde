class Mover {
  PVector pos;
  PVector vel;
  PVector acc;
  float mass;

  float angle;
  float angVel;
  float angAcc;


  Mover(float _m, float _x, float _y) {
    pos = new PVector(_x, _y);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    mass = _m;

    angle = 0;
    angVel = 0;
    angAcc = 0;
  }

  void update() {
    vel.add(acc);
    pos.add(vel);

    angAcc = acc.x / 10.0;

    angVel += angAcc;
    angVel = constrain(angVel, -0.5, 0.5);
    angle += angVel;
    
    println(angle);

    checkEdges();
    acc.mult(0);
  }

  void applyForce(PVector _f) {
    PVector force = PVector.div(_f, mass);
    acc.add(force);
  }

  void render() {
    noStroke();
    fill(200);
    rectMode(CENTER);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(angle);
    rect(0, 0, mass*16, mass*16);
    popMatrix();
  }

  void checkEdges() {
    if (pos.x > width) {
      pos.x = width;
      vel.x *= -1;
    } else if (pos.x < 0) {
      pos.x = 0;
      vel.x *= -1;
    }
    if (pos.y > height) {
      pos.y = height;
      vel.y *= -1;
    }
  }
}
