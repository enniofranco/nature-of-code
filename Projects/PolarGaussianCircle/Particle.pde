class Particle {
  float angle;
  float angleIni;
  float radius;
  float x, y;
  float xAnc, yAnc;
  float size;
  
  Particle(float _xAnc, float _yAnc, float _angle, float _radius, float _size) {
    size = _size;
    angleIni = -PI/2; //Initiate at 90 degrees
    angle = angleIni + _angle;
    radius = _radius;
    xAnc = _xAnc;
    yAnc = _yAnc;
  }
  
  void update() {
    x = cos(angle) * radius + xAnc;
    y = sin(angle) * radius + yAnc;
  }
  
  void render() {
    noStroke();
    float test = random(100);
    if (test < 0.12) {
      fill(255, 10, 79, 240);
    } else if (test < 0.24) {
      fill(255, 100, 10, 240);
    } else {
      fill(245, 245, 238, 70);
    }
    ellipse(x, y, size, size);
  }
  
}
