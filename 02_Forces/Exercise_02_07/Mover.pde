class Mover {
  PVector pos;
  PVector vel;
  PVector acc;
  float mass;

  Mover(float m, float x, float y) {
    pos = new PVector(x, y);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    mass = m;
  }

  void update() {
    vel.add(acc);
    pos.add(vel);
    checkEdges();
    acc.mult(0);

  }

  void render() {
    noStroke();
    fill(200, 100);
    ellipse(pos.x, pos.y, mass*24, mass*24);
  }
  
  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acc.add(f);
  }

  //Edges no longer bounce, they're continuous
  void checkEdges() {
    if (pos.x > width) {
      pos.x = 0;
      //vel.x *= -1;
    } else if (pos.x < 0) {
      pos.x = width;
      //vel.x *= -1;
    }

    if (pos.y > height) {
      pos.y = height;
      vel.y *= -1;
    }
  }

}
