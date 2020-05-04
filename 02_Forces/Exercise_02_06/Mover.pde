class Mover {
  PVector pos;
  PVector vel;
  PVector acc;
  float mass;
  float surface;

  Mover(float m, float x, float y) {
    pos = new PVector(x, y);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    mass = m;
    surface = random(0.3, 4);
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
    rectMode(CENTER);
    //rect(pos.x, pos.y, mass * 24, mass * 24);
    //Objects should have the same mass when calling the Mover function
    //The only change is in the surface size
    rect(pos.x, pos.y, surface * 24, 24);
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
    //Add the area surface (make it weaker)
    float dragMagnitude = l.c * speed * speed * surface;
    
    PVector drag = vel.copy();
    drag.mult(-1);
    drag.normalize();
    drag.mult(dragMagnitude);
    
    applyForce(drag);
  }
}
