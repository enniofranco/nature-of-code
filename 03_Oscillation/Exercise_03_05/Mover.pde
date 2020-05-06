class Mover {
  PVector pos;
  PVector vel;
  PVector acc;
  
  // Arbitrary damping to slow down ship
  float damping = 0.995;
  float topspeed = 6;
  
  // Variable for heading!
  float heading = 0;

  // Size
  float r = 16;
  
  Mover() {
    pos = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
  }
  
  void update() {
    vel.add(acc);
    vel.mult(damping);
    vel.limit(topspeed);
    pos.add(vel);
    acc.mult(0);
    checkEdges();
  }
  
  void applyForce(PVector _f) {
    PVector force = _f.copy();
    acc.add(force);
  }
  
  void turn(float _ang) {
    heading += _ang;
  }
  
  void thrust() {
    float angle = heading - PI/2;
    PVector force = new PVector(cos(angle), sin(angle));
    force.mult(0.1);
    applyForce(force);
  }
  
  void render() {
    noStroke();
    fill(100);
    rectMode(CENTER);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(heading);
    rect(0, 0, 16, 32);
    popMatrix();
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
