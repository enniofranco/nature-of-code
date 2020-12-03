class Particle {
  PVector pos;
  PVector vel;
  PVector acc;
  float lifespan;
  
  float mass = random(1.5, 3);
  
  Particle(PVector p) {
    acc = new PVector(0, 0);
    vel = new PVector(random(-1,1), random(-2,1));
    pos = p.copy();
    lifespan = 255.0;
  }
  
  void run() {
    update();
    display();
  }
  
  void applyForce(PVector force) {
    PVector f = force.copy();
    f.div(mass);
    acc.add(f);
  }
  
  void update() {
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);
    lifespan -= 3;
    vel.limit(10);
  }
  
  void display() {
    noStroke();
    fill(127, lifespan);
    ellipse(pos.x, pos.y, 5*mass, 5*mass);
  }
  
  boolean isDead() {
    if (lifespan < 0) {
      return true;
    } else {
      return false;
    }
  }
}
