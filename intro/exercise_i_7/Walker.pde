class Walker {
  
  float x;
  float y;
  float tx;
  float ty;
  
  Walker() {
    
    x = width/2;
    y = height/2;
    tx = 0;
    ty = 93716;
    
  }
  
  void step() {
    
    float stepSizeX = map(noise(tx),0,1,0.01,20);
    float stepSizeY = map(noise(ty),0,1,0.01,20);
    float stepX = random(-1,1) * stepSizeX;
    float stepY = random(-1,1) * stepSizeY;
    //float stepX = map(noise(tx),0,1,-2,2);
    //float stepY = map(noise(ty),0,1,-2,2);
    x += stepX;
    y += stepY;
    tx += 0.01;
    ty += 0.01;
    
    println("stepX = " + stepX + " stepY = " + stepY);
    
  }
  
  void display() {
    
    noStroke();
    fill(20);
    if(x > width) {
      x = 0;
    } else if(x < 0) {
      x = width;
    } else if(y > height) {
      y = 0;
    } else if (y < 0) {
      y = height;
    }
    ellipse(x,y,5,5);
    
  }
  
}
