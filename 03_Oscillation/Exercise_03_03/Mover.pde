class Mover {
  PVector pos;
  PVector vel;
  PVector acc;
  float heading;
  float topspeed;

  Mover() {
    pos = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    heading = 0;
    topspeed = 6;
  }

  void update() {
    vel.add(acc);
    pos.add(vel);
    vel.limit(topspeed);
    acc.mult(0);
    checkEdges();
  }
  
  void turn(float _angle) {
    heading += _angle;
  }

  void render() {
    rectMode(CENTER);
    fill(100);
    noStroke();
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(heading);
    rect(0, 0, 32, 16);
    popMatrix();
  }

  void applyForce(PVector _f) {
    //Ignore mass
    PVector force = _f.copy();
    acc.add(force);
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
