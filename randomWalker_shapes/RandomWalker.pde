class RandomWalker {
  PVector position;
  PVector destination;
  int choice;
  float increment;
  
  RandomWalker() {
    position = new PVector(width/2, height/2);
    increment = 15;
  }
  
  void update() {
    setDestination();
    
    PVector test = PVector.add(position, destination);
    
    while(test.x > width || test.x < 0 || test.y > height || test.y < 0) {
      setDestination();
      test.mult(0);
      test = PVector.add(position, destination);
    }
    position.add(destination);
  }
  
  void setDestination() {
    destination = PVector.random2D();
    destination.x = round(destination.x)*increment;
    destination.y = round(destination.y)*increment;
  }
  
  void render() {
    noStroke();
    fill(62, 46, 230, 10);
    ellipse(position.x, position.y, increment, increment);
  }
}
