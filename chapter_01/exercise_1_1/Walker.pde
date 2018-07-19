class Walker {
  PVector location;
  PVector time;
  PVector increment;

  Walker() {
    increment = new PVector(0.02,0.02);
    time = new PVector(0,10000);
    location = new PVector(width/2,height/2);
  }

  void step() {
    //[full] x- and y-location mapped from noise
    //float x = map(noise(time.x), 0, 1, 0, width);
    //float y = map(noise(time.y), 0, 1, 0, height);
    location.set(map(noise(time.x), 0, 1, 0, width),map(noise(time.y), 0, 1, 0, height));
    //[end]

    //[full] Move forward through “time.”
    time.add(increment);
    //[end]
  }
  
  void display() {
    noStroke();
    fill(30);
    ellipse(location.x,location.y,5,5);
  }
}
