class Ball {
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector time;
  float topspeed;
  
  Ball() {
    
    location = new PVector(width/2,height/2);
    velocity = new PVector(0,0);
    acceleration = new PVector(0.5,0.0);
    topspeed = 10;
    time = new PVector(0,9600);
    
  }
  
  void move() {
    
    float timeX = map(noise(time.x), 0, 1, -1, 1);
    float timeY = map(noise(time.y), 0, 1, -1, 1);
    acceleration.set(timeX,timeY);
    
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
    
    time.add(0.03,0.03);
    println(acceleration);
    
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
