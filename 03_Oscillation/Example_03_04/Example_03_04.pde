float r = 160;
float theta = 0;

void setup() {
  size(600, 600);
  pixelDensity(displayDensity());
}

void draw() {
  
  background(200);
  
  float x = r * cos(theta);
  float y = r * sin(theta);
  
  strokeWeight(2);
  stroke(100);
  line(width/2, height/2, x+width/2, y+width/2); 
  noStroke();
  fill(100);
  ellipse(x+width/2, y+width/2, 24, 24);
  
  theta += 0.05;
}
