class Attractor {
  
  float G = 100;
  
  PVector pos;
  float r = 10;
  
  Attractor(float x, float y) {
    pos = new PVector(x,y);
  }
  
  void display() {
    noStroke();
    fill(175);
    ellipse(pos.x, pos.y, 48, 48);
  }
  
  PVector attract(Particle p) {
    PVector dir = PVector.sub(pos, p.pos);
    float d = dir.mag();
    dir.normalize();
    d = constrain(d, 5, 100);
    float force = G / (d * d);
    dir.mult(force);
    return dir;
  }
}
