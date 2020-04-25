PVector pos;
PVector centre;
PVector disFromCentre;
float shapeSize;

void setup() {
  pixelDensity(displayDensity());
  background(200);
  size(600, 600);
  centre = new PVector(width/2, height/2);
}

void draw() {
  float xNum = randomGaussian();
  float yNum = randomGaussian();
  float xSd = 80;
  float ySd = 80;
  float xMean = width/2;
  float yMean = height/2;

  float x = xSd * xNum + xMean;
  float y = ySd * yNum + yMean;
  pos = new PVector(x, y);
  disFromCentre = PVector.sub(pos, centre);
  shapeSize = map(disFromCentre.mag(), 0, 300, 30, 6);
  
  //Test the magnitude of disFromCentre vector
  //pushMatrix();
  //translate(width/2, height/2);
  //stroke(0);
  //line(0, 0, disFromCentre.x, disFromCentre.y);
  //popMatrix();
  
  noStroke();
  fill(0, 50);
  ellipse(x, y, shapeSize, shapeSize);
}
