class Mover {
  PVector pos;
  PVector vel;
  PVector acc;
  
  Mover() {
    pos = new PVector (random(0, width), random(0, height));
    vel = new PVector (0, 0);
    acc = new PVector (random(-0.5, 0.5), random(-0.5, 0.5));
  }
  
  void move() {
    vel.add(acc);
    pos.add(vel);
    
    vel.limit(15);
    
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
      pos.y = height;
    }
  }
}
