class NoiseLoop {

  OpenSimplexNoise oSnoise;

  NoiseLoop() {
    oSnoise = new OpenSimplexNoise();
  }

  float value(float _angle, float _zDimension, float _fourthDimension) {
    float xoff = map(cos(_angle), -1, 1, 0, 2.3);
    float yoff = map(sin(_angle), -1, 1, 0, 2.3);
    float radius = (float) oSnoise.eval(xoff, yoff, _zDimension);
    //float radius = map(n, -1, 1, 10, 180);

    return radius;
  }
}
