float theta;
float aVel;
float aAcc;
float r;
float xoff;
float noff;

void setup() {
  size(600, 600, FX2D);
  theta = 0;
  aVel = 0;
  xoff = 0;
}

void draw() {
  background(200);
  aAcc = noise(noff);
  aAcc = map(aAcc, 0, 1, -0.01, 0.01);
  float noise = noise(xoff); 
  //float rScale = floor(theta / PI) / 10;
  //rScale *= 10;
  //r = map(noise, 0, 1, 0, 150-rScale);
  r = map(noise, 0, 1, 0, 150);
  aVel += aAcc;
  theta += aVel;
  aVel = constrain(aVel, -0.1, 0.1);
  float x = r * cos(theta);
  float y = r * sin(theta);
  
  pushMatrix();
  translate(width/2, height/2);
  line(0, 0, x, y);
  ellipse(x, y, 12, 12);
  popMatrix();
  
  xoff += 0.01;
  noff += 0.01;
  //rScale /= 10;
  //println(rScale);
}
