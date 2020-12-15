int stepNumberOf;
float stepHeight;
float stepWidth;
float stepIncrement;
float canvasWidth;
float x, y;

MCQBColours mcqbColours;

void setup() {
  size(600, 600);
  mcqbColours = new MCQBColours();
  stepNumberOf = 12; //Visible steps
  stepHeight = float(height) / float(stepNumberOf);
  stepNumberOf += 2; //Add one above and below
  stepIncrement = 1;
  if (width >= height) {
    canvasWidth = height;
  } else {
    canvasWidth = width;
  }
  stepWidth = (width/2) + (canvasWidth/2) + stepHeight/2;
  x = 0;
  y = height;
}

void draw() {
  background(mcqbColours.cRed_);
  stepAnimationLoop();
}

void step() {
  if (y > height - stepHeight) {
    y -= stepIncrement;
    stepWidth -= stepIncrement;
  } else {
    y = height;
    stepWidth = (width/2) + (canvasWidth/2) + stepHeight/2;
  }
}

void stepAnimationLoop() {
  step();
  fill(mcqbColours.cOran);
  noStroke();
  float _y = y;
  float _stepWidth = stepWidth;
  for (int i = 0; i < stepNumberOf; i++) {
    rect(x, _y, _stepWidth, stepHeight);
    _y -= stepHeight;
    _stepWidth -= stepHeight;
  }
}
