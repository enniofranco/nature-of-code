class Banner {
  PVector pos;
  float bannerSize;

  Banner(float _x, float _y, float _bannerSize) {
    pos = new PVector(_x, _y);
    bannerSize = _bannerSize;
  }

  void render(float _noiseVal) {
    float angle = map(_noiseVal, 0, 1, -PI*2+PI/2, PI*2+PI/2);
    PVector point1 = new PVector(pos.x, pos.y - bannerSize/2);
    PVector point2 = new PVector(point1.x, point1.y + bannerSize);
    float x = point2.x + (bannerSize * cos(angle));
    float y = point2.y + (bannerSize * sin(angle));
    PVector point3 = new PVector(x, y);
    x = point1.x + (bannerSize * cos(angle));
    y = point1.y + (bannerSize * sin(angle));
    PVector point4 = new PVector(x, y);

    noStroke();
    float cRed = map(angle, -PI*2, PI*2, 106, 187);
    float cGreen = map(angle, -PI*2, PI*2, 133, 166);
    float cBlue = map(angle, -PI*2, PI*2, 114, 113);
    
    float angleAlpha;
    if (angle > PI/2) {
      angleAlpha = map(angle, PI/2, PI*2+PI/2, 20, 200);
    } else {
      angleAlpha = map(angle, PI/2, -PI*2+PI/2, 20, 200);
    }
    fill(cRed, cGreen, cBlue, angleAlpha);
    beginShape();
    vertex(point1.x, point1.y);
    vertex(point2.x, point2.y);
    vertex(point3.x, point3.y);
    vertex(point4.x, point4.y);
    endShape(CLOSE);
  }
}
