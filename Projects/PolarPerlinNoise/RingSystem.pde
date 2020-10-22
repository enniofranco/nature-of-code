class RingSystem {
  NoiseLoop noiseLoop;

  float iniX, iniY;
  float min, max;
  int rings;
  int stepsPerRing;
  float angle;
  float radius;
  
  float zDimension;
  float fourthDimension;

  RingSystem(float _x, float _y, float _min, float _max, int _rings, int _stepsPerRing) {
    noiseLoop = new NoiseLoop();

    iniX = _x;
    iniY = _y;
    min = _min;
    max = _max;
    rings = _rings;
    stepsPerRing = _stepsPerRing;
    angle = 0;
    
    zDimension = random(1000);
    fourthDimension = 0;
  }

  void render() {
    //float zTemp = zDimension;
    for (int j = 0; j < rings; j++) {
      beginShape();
      for (int i = 0; i < stepsPerRing; i++) {
        float n = noiseLoop.value(angle, zDimension, fourthDimension);
        radius = map(n, -1, 1, min, max);
        radius += j*0.9;
        float x = radius * cos(angle) + iniX;
        float y = radius * sin(angle) + iniY;
        vertex(x, y);
        angle += TWO_PI / stepsPerRing;
      }
      endShape(CLOSE);
      angle = 0;
      zDimension += 0.03;
    }
    zDimension = 0;
    fourthDimension += 0.1;
  }
}
