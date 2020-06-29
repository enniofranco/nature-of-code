class Leg {
  PVector anchor;
  PVector pos;
  float angle;
  float vel;
  PVector amplitude;

  Leg(float _x, float _y, float _angle) {
    anchor = new PVector(_x, _y);
    pos = new PVector();
    angle = _angle;
    vel = 0.02;
    amplitude = new PVector(30, 0);
  }

  void update() {
    pos.x = sin(angle) * amplitude.x;
    if((angle + HALF_PI) % TWO_PI < PI) {
      amplitude.y = 5;
    } else {
      amplitude.y = 15;
    }
    pos.y = cos(angle) * amplitude.y;
    angle += vel;
  }

  void render() {
    stroke(100);
    line(anchor.x, anchor.y - 30, anchor.x+pos.x, anchor.y+pos.y);
    fill(100);
    ellipse(anchor.x+pos.x, anchor.y+pos.y, 8, 8);
  }
}
