class Mover {
  PVector pos;
  PVector vel;
  PVector acc;

  Mover() {
    pos = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
  }

  void update() {
    
    PVector mouse = new PVector(mouseX, mouseY);
    PVector dir = PVector.sub(mouse, pos);
    dir.normalize();
    acc = dir;
    
    vel.add(acc);
    vel.limit(10);
    pos.add(vel);
    //checkEdges();

  }

  void render() {
    float angle = atan2(vel.y, vel.x);
    //Shiffman's note:
    //To simplify this even further, the PVector class itself
    //provides a function called heading(), which takes care
    //of calling atan2() for you so you can get the 2D direction angle,
    //in radians, for any Processing PVector.
    // ---> float angle = velocity.heading();
    
    noStroke();
    fill(200);
    rectMode(CENTER);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(angle);
    rect(0, 0, 30, 12);
    popMatrix();
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
