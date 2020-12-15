MCQBColours mcqbColours;
Steps stepsA;
Steps stepsB;
int flag;

void setup() {
  size(600, 600);
  mcqbColours = new MCQBColours();
  stepsA = new Steps(13);
  stepsB = new Steps(7);
}

void draw() {
  background(mcqbColours.cRed_);
  float num = random(1);
  
  if(num < 0.05) {
    flag = int(random(2));
    println(flag);
  }
    
  if (flag == 0) {
    stepsA.stepAnimationLoop();
  } else {
    stepsB.stepAnimationLoop();
  }
}
