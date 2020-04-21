class Walker {
  PVector pos;
  
  Walker() {
    pos = new PVector(width/2, height/2);
  }
  
  void step() {
    PVector randomStep = PVector.random2D();
    pos.add(randomStep);
  }
  
  void render() {
    noStroke();
    fill(255, 40);
    ellipse(pos.x, pos.y, 8, 8);
  }
  
}
