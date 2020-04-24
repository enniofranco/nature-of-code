void setup() {
  pixelDensity(displayDensity());
  background(75);
  size(640, 360);
}

void draw() {
  float num = randomGaussian();
  float sd = 60;
  float mean = width/2;
  
  float x = sd * num + mean;
  
  noStroke();
  fill(255, 5);
  ellipse(x, height/2, 16, 16);
}
