class Particle {
  PVector pos;
  PVector vel;
  PVector acc;

  float lifespan;

  Particle() {
    acc = new PVector(0, 0.05);
    vel = new PVector(random(-1, 1), random(-1, 1));
    pos = new PVector(width/2, 20);

    lifespan = 255;
  }

  void applyForce(PVector force) {
    acc.add(force);
  }

  void update() {
    vel.add(acc);
    pos.add(vel);
    lifespan -= 2;
    acc.mult(0);
  }

  boolean isDead() {
    if (lifespan <= 0) {
      return true;
    } else {
      return false;
    }
  }

  void display() {
    //stroke(0, lifespan);
    //strokeWeight(2);
    noStroke();
    fill(50, lifespan);
    ellipse(pos.x, pos.y, 12, 12);
  }
}
