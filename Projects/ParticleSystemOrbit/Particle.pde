class Particle {
  PVector pos;
  PVector vel;
  PVector acc;
  float lifespan;
  color particleColour;
  
  float mass = random(1.5, 3);
  
  Particle(PVector p) {
    acc = new PVector(0, 0);
    vel = new PVector(random(-1,1), random(-2,1));
    pos = p.copy();
    lifespan = 255.0;
    float num = random(100);
    if (num < 1) {
      particleColour = color(255, 10, 79);
    } else {
      particleColour = color(26, 26, 26);
    }
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
    fill(particleColour, lifespan);
    ellipse(pos.x, pos.y, 6*mass, 6*mass);
  }
  
  boolean isDead() {
    if (lifespan < 0) {
      return true;
    } else {
      return false;
    }
  }
}
