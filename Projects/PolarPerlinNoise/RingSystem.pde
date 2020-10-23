class RingSystem {
  NoiseLoop noiseLoop;

  float iniX, iniY;
  float min, max;
  int rings;
  int stepsPerRing;
  float angle;
  float radius;

  //float zDimension;
  //float fourthDimension;
  float uoff;
  float voff;
  float joff;

  RingSystem(float _x, float _y, float _min, float _max, int _rings, int _stepsPerRing) {
    noiseLoop = new NoiseLoop();

    iniX = _x;
    iniY = _y;
    min = _min;
    max = _max;
    rings = _rings;
    stepsPerRing = _stepsPerRing;
    angle = 0;

    //zDimension = random(1000);
    uoff = random(1000);
    //fourthDimension = 0;
  }

  void render(float _percent) {
    //float uangle = map(_percent, 0, 1, 0, TWO_PI);
    //uoff = map(cos(uangle), -1, 1, 0, 10);
    //voff = map(sin(uangle), -1, 1, 0, 10);
    float uangle = map(_percent, 0, 1, 0, TWO_PI);
    //uoff = map(cos(uangle), -1, 1, 0, 10);
    //voff = map(sin(uangle), -1, 1, 0, 10);
    for (int j = 0; j < rings; j++) {
      beginShape();
      for (int i = 0; i < stepsPerRing; i++) {
        float n = noiseLoop.value(angle, uoff, voff);
        //radius = map(n, -1, 1, min, max);  OPENSIMPLEX
        radius = map(n, 0, 1, min, max);
        radius += j;
        float x = radius * cos(angle) + iniX;
        float y = radius * sin(angle) + iniY;
        vertex(x, y);
        angle += TWO_PI / stepsPerRing;
      }
      endShape(CLOSE);
      angle = 0;
      uoff += 0.03;
    }
    uoff = 0;
    //fourthDimension += 0.1;
  }
}
