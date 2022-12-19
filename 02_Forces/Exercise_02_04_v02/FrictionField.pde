class FrictionField {
  float x, y, w, h;
  float c;
  
  FrictionField(float x_, float y_, float w_, float h_, float c_) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    c = c_;
  }
  
  void render() {
    noStroke();
    fill(200, 50);
    rect(x, y, w, h);
  }
}
