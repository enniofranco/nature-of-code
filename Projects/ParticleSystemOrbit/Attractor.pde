class Attractor {
  
  float G = 100;
  
  PVector pos;
  float tx, ty;
  //float r = 10;
  float mass;
  
  Attractor(float x, float y) {
    mass = 3;
    pos = new PVector(x,y);
    tx = 0;
    ty = 10000;
  }
  
  void display() {
    noStroke();
    fill(255, 100, 10);
    ellipse(pos.x, pos.y, 52, 52);
  }
  
  PVector attract(Particle p) {
    PVector dir = PVector.sub(pos, p.pos);
    float d = dir.mag();
    dir.normalize();
    d = constrain(d, 5, 50);
    float force = G * mass * p.mass / (d * d);
    //float force = G / (d * d);
    dir.mult(force);
    return dir;
  }
  
  PVector attractSystem(PVector _pos, float _mass) {
    PVector dir = PVector.sub(pos, _pos);
    float d = dir.mag();
    dir.normalize();
    d = constrain(d, 5, 25);
    float force = G * mass * _mass / (d * d);
    //float force = G / (d * d);
    dir.mult(force);
    return dir;
  }
  
  void step() {
    pos.x = map(noise(tx), 0, 1, 0, width);
    pos.y = map(noise(ty), 0, 1, 0, height);
    tx += 0.008;
    ty += 0.008;
  }
}
