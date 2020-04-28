class Bouncer {
  PVector pos;
  PVector vel;

  Bouncer() {
    pos = new PVector(random(0, width), random(0, height));
    vel = new PVector(random(-2, 2), random(-2, 2));
  }

  void update() {
    pos.add(vel);
    if (pos.x > width || pos.x < 0) {
      vel.x *= -1;
    }
    if (pos.y > height || pos.y < 0) {
      vel.y *= -1;
    }
  }

  void render() {
    noStroke();
    fill(200);
    ellipse(pos.x, pos.y, 20, 20);
  }
}
