class Banner {
  PVector pos;
  float bannerSize;

  Banner(float _x, float _y) {
    pos = new PVector(_x, _y);
    bannerSize = 10;
  }

  void render(float _noiseVal) {
    float angle = map(_noiseVal, 0, 1, 0, TWO_PI);
    PVector point1 = new PVector(pos.x, pos.y - bannerSize/2);
    PVector point2 = new PVector(point1.x, point1.y + bannerSize);
    float x = point2.x + (bannerSize * cos(angle));
    float y = point2.y + (bannerSize * sin(angle));
    PVector point3 = new PVector(x, y);
    x = point1.x + (bannerSize * cos(angle));
    y = point1.y + (bannerSize * sin(angle));
    PVector point4 = new PVector(x, y);

    noStroke();
    fill(100, 100);
    beginShape();
    vertex(point1.x, point1.y);
    vertex(point2.x, point2.y);
    vertex(point3.x, point3.y);
    vertex(point4.x, point4.y);
    endShape(CLOSE);
  }
}
