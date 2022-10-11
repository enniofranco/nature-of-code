class Walker {
  PVector location;
  PVector step;
  float walkerSize;
  
  Walker() {
    //Calculate central area
    float x1 = width/4;
    float x2 = x1 * 3;
    float y1 = height/4;
    float y2 = y1 * 3;
    float randomX = random(x1, x2);
    float randomY = random(y1, y2);
    location = new PVector(randomX, randomY);
    walkerSize = random(4, 32);
  }
  
  void calculate() {
    step = new PVector();
    step = PVector.random2D();
    step.mult(1.2);
    location.add(step);
  }
  
  void render() {
    fill(0);
    noStroke();
    ellipse(location.x, location.y, walkerSize, walkerSize);
  }
  
}
