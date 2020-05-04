class Mover {
  PVector pos;
  PVector vel;
  PVector acc;
  float mass;
  
  //Made drag force vector available from the main sketch so I can println the drag vector
  PVector dragF;

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
  
  boolean isInside(Liquid l) {
    if (pos.x > l.x && pos.x < l.x + l.w && pos.y > l.y && pos.y < l.y + l.h) {
      return true;
    } else {
      return false;
    }
  }
  
  void drag(Liquid l) {
    float speed = vel.mag();
    float dragMagnitude = l.c * speed * speed;
    
    dragF = vel.copy();
    dragF.mult(-1);
    dragF.normalize();
    dragF.mult(dragMagnitude);
    
    applyForce(dragF);
  }
}
