class Walker {
  PVector pos;
  float noff;
  
  Walker() {
    pos = new PVector(width/2, height/2);
  }
  
  void step() {
    PVector stepV = PVector.random2D();
    float stepSize = map(noise(noff), 0, 1, 0, 10);
    stepV.mult(stepSize);
    pos.add(stepV);
    println(stepV.mag());
    noff += 0.01;
  }
  
  void render() {
    noStroke();
    ellipse(pos.x, pos.y, 20, 20);
  }
}
