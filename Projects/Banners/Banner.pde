class Banner {
  PVector pos;
  float bannerSize;
  PVector colourBg;
  PVector colour1;
  PVector colour2;

  Banner(float _x, float _y, float _bannerSize) {
    pos = new PVector(_x, _y);
    bannerSize = _bannerSize;
    colourBg = new PVector(4, 28, 224);
    colour1 = new PVector(255, 10, 79);
    colour2 = new PVector(255, 100, 10);
  }

  void render(float _noiseVal) {
    float angle = map(_noiseVal, 0, 1, -PI*2+PI/2, PI*2+PI/2);
    //float angle = map(mouseX, 0, width, -PI*2+PI/2, PI*2+PI/2);
    PVector point1 = new PVector(pos.x, pos.y - bannerSize/2);
    PVector point2 = new PVector(point1.x, point1.y + bannerSize);
    float x = point2.x + (bannerSize * cos(angle));
    float y = point2.y + (bannerSize * sin(angle));
    PVector point3 = new PVector(x, y);
    x = point1.x + (bannerSize * cos(angle));
    y = point1.y + (bannerSize * sin(angle));
    PVector point4 = new PVector(x, y);

    noStroke();
    float _Red;
    float _Green;
    float _Blue;

    if (angle > PI/2) {
      //_Red = map(angle, PI/2, PI*2+PI/2, colourBg.x, colour1.x);
      //_Green = map(angle, PI/2, PI*2+PI/2, colourBg.y, colour1.y);
      //_Blue = map(angle, PI/2, PI*2+PI/2, colourBg.z, colour1.z);
      _Red = map(angle, PI/2, PI+PI/2, colourBg.x, colour1.x);
      _Green = map(angle, PI/2, PI+PI/2, colourBg.y, colour1.y);
      _Blue = map(angle, PI/2, PI+PI/2, colourBg.z, colour1.z);
      constrain(_Red,colourBg.x,colour1.x);
      constrain(_Green,colourBg.y,colour1.y);
      constrain(_Blue,colourBg.z,colour1.z);
    } else {
      //_Red = map(angle, PI/2, -PI*2+PI/2, colourBg.x, colour2.x);
      //_Green = map(angle, PI/2, -PI*2+PI/2, colourBg.y, colour2.y);
      //_Blue = map(angle, PI/2, -PI*2+PI/2, colourBg.z, colour2.z);
      _Red = map(angle, PI/2, -PI+PI/2, colourBg.x, colour2.x);
      _Green = map(angle, PI/2, -PI+PI/2, colourBg.y, colour2.y);
      _Blue = map(angle, PI/2, -PI+PI/2, colourBg.z, colour2.z);
      constrain(_Red,colourBg.x,colour2.x);
      constrain(_Green,colourBg.y,colour2.y);
      constrain(_Blue,colourBg.z,colour2.z);
    }
    fill(_Red, _Green, _Blue, 200);
    beginShape();
    vertex(point1.x, point1.y);
    vertex(point2.x, point2.y);
    vertex(point3.x, point3.y);
    vertex(point4.x, point4.y);
    endShape(CLOSE);
  }
}
