class Walker {
  PVector pos;
  
  Walker() {
    pos = new PVector(width/2, height/2);
  }
  
  void step() {
    PVector randomV = PVector.random2D();
    float num = randomGaussian();
    float mean = 10;
    float sd = 20;
    float stepSize = (sd * num) + mean;
    PVector randomStep = PVector.mult(randomV, stepSize);
    pos.add(randomStep);
    //println("randomStep = " + randomStep);
    //println("stepSize = " + stepSize);
    //println("pos = " + pos);
  }
  
  void render() {
    noStroke();
    ellipse(pos.x, pos.y, 8, 8);
  }
  
}
