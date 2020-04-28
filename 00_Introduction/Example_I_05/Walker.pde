class Walker {
  PVector pos;
  PVector noff;
  
  Walker() {
    pos = new PVector(width/2, height/2);
    noff = new PVector(random(1000), random(1000));
  }
  
  void step() {
    pos.x = map(noise(noff.x), 0, 1, 0, width);
    pos.y = map(noise(noff.y), 0, 1, 0, height);
    
    noff.add(0.005, 0.005);
  }
  
  void render() {
    noStroke();
    fill(100);
    ellipse(pos.x, pos.y, 40, 40);
  }
}
