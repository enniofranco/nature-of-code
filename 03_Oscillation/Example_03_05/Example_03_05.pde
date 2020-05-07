float amplitude;
float period;

void setup() {
  size(600, 600);
  pixelDensity(displayDensity());
  amplitude = 100;
  period = 120;
}

void draw() {
  background(200);
  
  float x = amplitude * cos(TWO_PI * frameCount / period);
  
  stroke(100);
  fill(100);
  translate(width/2, height/2);
  line(0, 0, x, 0);
  ellipse(x, 0, 20, 20);
}
