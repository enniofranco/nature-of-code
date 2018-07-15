float shapeSizeInit;

void setup() {
  
  size (800,800);
  background(240);
  shapeSizeInit = 30;
  
}

void draw() {
  
  float numX = randomGaussian();
  float numY = randomGaussian();
  float sdX = 120;
  float sdY = 120;
  pushMatrix();
  //the mean is now the center of the screen, no need to offset the mean
  translate(width/2,height/2);
  
  float x = sdX * numX;
  float y = sdY * numY;
  
  float shapeSizeX = map(abs(x),0,400,1,0.1);
  float shapeSizeY = map(abs(y),0,400,1,0.1);
  //float shapeSize = map(abs(x),0,400,1,0.1);
  float rgbRed = map(abs(x),0,400,0,255);
  
  noStroke();
  fill(0, rgbRed, 120, 40);
  ellipse(x,y,shapeSizeInit*shapeSizeX*shapeSizeY,shapeSizeInit*shapeSizeX*shapeSizeY);
  //for tests purposes
  //ellipse(x,0,shapeSizeInit*shapeSize,shapeSizeInit*shapeSize);
  //ellipse(x,0,shapeSizeInit*shapeSizeX,shapeSizeInit*shapeSizeX);
  //ellipse(0,y,shapeSizeInit*shapeSizeY,shapeSizeInit*shapeSizeY);
  
  popMatrix();
  
}
