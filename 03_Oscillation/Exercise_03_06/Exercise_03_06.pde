float amplitude;
float period;

void setup() {
  size(600, 600);
  pixelDensity(displayDensity());
  period = 120;
}

void draw() {
  background(200);
  
  //float x = amplitude * cos(TWO_PI * frameCount / period);
  //Option using map();
  float y = map(sin(TWO_PI * frameCount / period), -1, 1, 10, 300);
  
  stroke(100);
  fill(100);
  translate(width/2, 0);
  line(0, 0, 0, y);
  ellipse(0, y, 40, 40);
}
