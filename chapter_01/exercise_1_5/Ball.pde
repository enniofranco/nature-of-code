class Ball {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;
  
  Ball() {
    
    location = new PVector(width/2,height/2);
    velocity = new PVector(0,0);
    acceleration = new PVector(-0.003,0.03);
    topspeed = 10;
    
  }
  
  void move() {
    
    if(keyPressed) {
      println("merd");
      if(key == 't') {
        velocity.add(acceleration);
      }
      if(key == 'y') {
        println(acceleration);
        velocity.sub(acceleration);
      }
    }
    //velocity.limit(topspeed);
    location.add(velocity);
    
  }
  
  void bounce() {
    if(location.x > width) {
      location.x = 0;
    } else if (location.x < 0) {
      location.x = width;
    }
    
    if(location.y > height) {
      location.y = 0;
    } else if(location.y < 0) {
      location.y = height;
    }
    
  }
  
  void display() {
    
    noStroke();
    fill(127);
    ellipse(location.x, location.y, 16, 16);
    
  }
  
}
