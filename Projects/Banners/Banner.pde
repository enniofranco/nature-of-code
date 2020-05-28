class Banner {
  PVector pos;
  float bannerSize;
  PVector colourBg;
  PVector colour1;
  PVector colour2;
  float angleOff;
  float angleMax;
  float angleMin;

  Banner(float _x, float _y, float _bannerSize) {
    pos = new PVector(_x, _y);
    bannerSize = _bannerSize;
    colourBg = new PVector(255, 239, 10);
    colour1 = new PVector(0, 184, 31);
    colour2 = new PVector(255, 100, 10);
    angleOff = PI/2;
    angleMax = PI*2 + angleOff;
    angleMin = -PI*2 + angleOff;
  }

  void render(float _noiseVal) {
    //float angle = map(_noiseVal, 0, 1, -PI*2+PI/2, PI*2+PI/2);
    float angle = map(mouseX, 0, width, angleMin, angleMax);
    PVector point1 = new PVector(pos.x, pos.y - bannerSize/2);
    PVector point2 = new PVector(point1.x, point1.y + bannerSize);
    float x = point2.x + (bannerSize * cos(angle));
    float y = point2.y + (bannerSize * sin(angle));
    PVector point3 = new PVector(x, y);
    x = point1.x + (bannerSize * cos(angle));
    y = point1.y + (bannerSize * sin(angle));
    PVector point4 = new PVector(x, y);

    noStroke();
    float _R;
    float _G;
    float _B;
    //float _angle;
    //_angle = constrain(angle, -PI+PI/2, PI+PI/2);

    if (angle > angleOff) {
      _R = map(angle, PI/2, PI+PI/2, colourBg.x, colour1.x);
      _G = map(angle, PI/2, PI+PI/2, colourBg.y, colour1.y);
      _B = map(angle, PI/2, PI+PI/2, colourBg.z, colour1.z);
      _R = constrain(_R, 0, 255);
      _G = constrain(_G, 0, 255);
      _B = constrain(_B, 0, 255);
      println(_R, _G, _B);
    } else {
      _R = map(angle, PI/2, -PI+PI/2, colourBg.x, colour2.x);
      _G = map(angle, PI/2, -PI+PI/2, colourBg.y, colour2.y);
      _B = map(angle, PI/2, -PI+PI/2, colourBg.z, colour2.z);
      _R = constrain(_R, colourBg.x, colour2.x);
      _G = constrain(_G, colourBg.y, colour2.y);
      _B = constrain(_B, colourBg.z, colour2.z);
    }
    fill(_R, _G, _B, 255);
    beginShape();
    vertex(point1.x, point1.y);
    vertex(point2.x, point2.y);
    vertex(point3.x, point3.y);
    vertex(point4.x, point4.y);
    endShape(CLOSE);
  }
}
