class Mover {
  PVector pos;
  PVector vel;
  PVector acc;

  Mover() {
    pos = new PVector (width/2, height/2);
    vel = new PVector (0, 0);
    acc = new PVector (0, 0);
  }

  void move() {
    //ACCELERATES
    if (keyPressed == true) {
      if (key == 'a') {
        acc.set(0.1, 0);
      }
    } else {
      acc.set(0, 0);
    }
    //BREAKES
    if (keyPressed == true) {
      if (key == 's') {
        PVector carBreak = PVector.mult(vel, -0.03);
        acc = carBreak;
      }
    }
    vel.add(acc);
    vel.limit(15);
    pos.add(vel);

    checkEdges();
  }

  void render() {
    noStroke();
    fill(100);
    ellipse(pos.x, pos.y, 16, 16);
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
