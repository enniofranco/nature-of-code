class Walker {
  
  float x;
  float y;
  
  Walker() {
    
    x = width/2;
    y = height/2;
    
  }
  
  void step() {
    
    //float stepsize = random(0,10);
    float stepsize = montecarlo();
 
    float stepx = random(-stepsize,stepsize);
    float stepy = random(-stepsize,stepsize);
    
    x += stepx;
    y += stepy;
    
  }
  
  
  void display() {
    
    noStroke();
    fill(0);
    ellipse(x,y,3,3);
    
  }
  
  float montecarlo() {
  // We do this “forever” until we find a qualifying random value.
  while (true) {
    // Pick a random value.
    float r1 = random(10);
    // Assign a probability.
    float probability = r1*r1;
    // Pick a second random value.
    float r2 = random(10);

    //[full] Does it qualify?  If so, we’re done!
    if (r2 < probability) {
      return r1;
    }
    //[end]
  }
}
  
}
