class Satellite {
  PVector pos;
  PVector vel;
  PVector acc;
  float mass;
  float angle;
  float aVel;
  float aAcc;

  Satellite(float _m, float _x, float _y) {
    pos = new PVector(_x, _y);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    mass = _m;
    angle = random(0, TWO_PI);
    aVel = 0;
  }

  void update() {
    vel.add(acc);
    pos.add(vel);

    aAcc = acc.x / 10;
    aVel += aAcc;
    aVel = constrain(aVel, -0.1, 0.1);
    angle += aVel;

    acc.mult(0);
  }

  void render() {
    noStroke();
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(angle);
    fill(100, 180);
    arc(0, 0, 16*mass, 16*mass, angle, angle+PI, OPEN);
    fill(0, 180);
    arc(0, 0, 16*mass, 16*mass, angle+PI, angle+TWO_PI, OPEN);
    //rectMode(CENTER);
    //rect(0, 0, 16*mass, 16*mass);
    popMatrix();
  }

  void applyForce(PVector _f) {
    PVector force = PVector.div(_f, mass);
    acc.add(force);
  }

  PVector attract (Satellite _s) {
    PVector force = PVector.sub(_s.pos, pos);
    float distance = force.mag();
    distance = constrain(distance, 5.0, 25.0);

    force.normalize();
    float strength = (G * mass * _s.mass) / (distance * distance);
    force.mult(strength);

    return force;
  }
}
