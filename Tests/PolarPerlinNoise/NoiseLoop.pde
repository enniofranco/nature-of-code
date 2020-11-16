class NoiseLoop {

  NoiseLoop() {
  }

  float value(float _angle, float _uoff, float _voff) {
    float xoff = map(cos(_angle), -1, 1, 0, 2);
    float yoff = map(sin(_angle), -1, 1, 0, 2);
    float radius = noise(xoff, yoff, _uoff);

    return radius;
  }
}


//class NoiseLoop {

//  OpenSimplexNoise oSnoise;

//  NoiseLoop() {
//    oSnoise = new OpenSimplexNoise();
//  }

//  float value(float _angle, float _uoff, float _voff) {
//    float xoff = map(cos(_angle), -1, 1, 0, 2.3);
//    float yoff = map(sin(_angle), -1, 1, 0, 2.3);
//    float radius = (float) oSnoise.eval(xoff, yoff, _uoff, _voff);

//    return radius;
//  }
//}
