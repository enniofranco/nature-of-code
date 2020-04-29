class Mover {
  PVector pos;
  PVector vel;
  PVector acc;

  Mover() {
    pos = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
  }

  void update() {
    acc = PVector.random2D();
    acc.mult(0.8);
    
    vel.add(acc);
    vel.limit(10);
    pos.add(vel);
    checkEdges();
  }

  void render() {
    noStroke();
    fill(200);
    ellipse(pos.x, pos.y, 24, 24);
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
