class Attractor {
  PVector pos;
  float mass;
  float G;

  Attractor() {
    pos = new PVector(width/2, height/2);
    mass = 20;
    G = 1;
  }

  PVector attract (Mover _m) {
    PVector force = PVector.sub(pos, _m.pos);
    float distance = force.mag();
    distance = constrain(distance, 5.0, 25.0);

    force.normalize();
    float strength = (G * mass * _m.mass) / (distance * distance);
    force.mult(strength);

    return force;
  }

  void render() {
    noStroke();
    fill(0, 180);
    ellipse(pos.x, pos.y, mass * 2, mass * 2);
  }
}
