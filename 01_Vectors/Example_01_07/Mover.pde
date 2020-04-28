class Mover {
  PVector pos;
  PVector vel;
  
  Mover() {
    pos = new PVector (random(0, width), random(0, height));
    vel = new PVector (random(-5, 5), random(-5, 5));
  }
  
  void move() {
    pos.add(vel);
    checkEdges();
  }
  
  void render() {
    noStroke();
    fill(100);
    ellipse(pos.x, pos.y, 16, 16);
  }
  
  void checkEdges() {
    if (pos.x > width) {
      pos.x = 0;
    } else if (pos.x < 0) {
      pos.x = width;
    }
    
    if (pos.y > height) {
      pos.y = 0;
    } else if (pos.y < 0) {
      pos.x = height;
    }
  }
}
