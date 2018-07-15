class Walker {
  
  float x;
  float y;
  
  Walker() {
    
    x = width/2;
    y = height/2;
    
  }
  
  void step() {
    
    int choice = int(random(4));
    
    float num = randomGaussian();
    //the mean is the distance the walker travels
    float mean = 5;
    //the standard deviation is how the step size varies
    float sd = 3;
    float stepSize = sd * num + mean;
    println(stepSize);
    
    if(choice == 0) {
      x += stepSize;
    } else if(choice == 1) {
      x -= stepSize;
    } else if(choice == 2) {
      y += stepSize;
    } else {
      y -= stepSize;
    }
    
  }
  
  
  void display() {
    
    noStroke();
    fill(0);
    ellipse(x,y,3,3);
    
  }
  
}
