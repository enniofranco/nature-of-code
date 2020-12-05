class Object {
  
  //Body body;
  
  PVector pos;
  float size;
  
  Object(PVector _pos, float _size) {
    pos = _pos.copy();
    size = _size;
  }
  
  void update() {
    
  }
  
  void render() {
    noStroke();
    fill(100, 200);
    ellipse(pos.x, pos.y, size, size);
  }
}
