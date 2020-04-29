class Mover {
  PVector pos;
  PVector vel;
  PVector acc;
  float xoff;
  float yoff;
  float perlinAcc;
  float increment;

  Mover() {
    pos = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    xoff = 0;
    yoff = 10000;
    increment = 0.01;
  }

  void update() {
    
    float x = map(noise(xoff), 0, 1, -1, 1);
    float y = map(noise(yoff), 0, 1, -1, 1);
    acc.set(x, y);
    
    vel.add(acc);
    vel.limit(10);
    pos.add(vel);
    checkEdges();
    
    xoff += increment;
    yoff += increment;
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
