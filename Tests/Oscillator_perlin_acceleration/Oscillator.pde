class Oscillator {
  PVector anchor;
  PVector angle;
  PVector vel;
  PVector acc;
  PVector amplitude;
  PVector pos;
  float tx, ty;

  Oscillator(float _x, float _y) {
    anchor = new PVector(_x, _y);
    angle = new PVector();
    //vel = new PVector(random(-0.05, 0.05), random(-0.05, 0.05));
    vel = new PVector(0, 0);
    acc = new PVector();
    amplitude = new PVector(random(200), random(200));
    pos = new PVector();
    tx = random(5000);
    ty = random(10000, 15000);
  }

  void update() {
    float n = noise(tx);
    acc.x = map(n, 0, 1, -0.005, 0.005);
    n = noise(ty);
    acc.y = map(n, 0, 1, -0.005, 0.005);

    pos.x = sin(angle.x) * amplitude.x;
    pos.y = sin(angle.y) * amplitude.y;
    vel.add(acc);
    vel.limit(0.07);
    angle.add(vel);
    
    tx += 0.01;
    ty += 0.01;
    acc.mult(0);
  }

  void render() {
    stroke(100);
    line(anchor.x, anchor.y, anchor.x+pos.x, anchor.y+pos.y);
    fill(100);
    ellipse(anchor.x+pos.x, anchor.y+pos.y, 16, 16);
  }
}
