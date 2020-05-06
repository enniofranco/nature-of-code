float r = 0;
float theta = 0;

void setup() {
  size(600, 600);
  pixelDensity(displayDensity());
}

void draw() {
  
  //background(200);
  
  float x = r * cos(theta);
  float y = r * sin(theta);
   
  noStroke();
  fill(100);
  ellipse(x+width/2, y+width/2, 24, 24);
  
  theta += 0.01;
  r += 0.05;
}
