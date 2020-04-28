class Walker {
  PVector pos;

  Walker() {
    pos = new PVector(width/2, height/2);
  }

  float montecarlo() {
    while (true) {
      float r1 = random(1);
      float probability = r1*r1;
      float r2 = random(1);
      
      if (r2 < probability) {
        return r1;
      }
    }
  }

  void step() {
    float stepSize = montecarlo() * 20;
    PVector randomV = PVector.random2D();
    PVector randomStep = PVector.mult(randomV, stepSize);
    pos.add(randomStep);
  }

  void render() {
    noStroke();
    ellipse(pos.x, pos.y, 8, 8);
  }
}
