class Mover {
  PVector pos;
  PVector vel;
  PVector acc;

  Mover() {
    pos = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
  }

  void update() {
    
    vel.add(acc);
    vel.limit(10);
    pos.add(vel);
    checkEdges();
    acc.mult(0);

  }

  void render() {
    noStroke();
    fill(200);
    ellipse(pos.x, pos.y, 24, 24);
  }
  
  void applyForce(PVector force) {
    acc.add(force);
  }

  void checkEdges() {
    if (pos.x > width) {
      pos.x = 0;
    } else if (pos.x < 0) {
      pos.x = width;
    }

    if (pos.y < 0) {
      vel.y *= -1;
    }
  }
}
