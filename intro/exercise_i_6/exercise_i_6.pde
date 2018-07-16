//I'm not yet sure how to verify
//if this exercise is correct or not

float x;
float y;
Walker w;

void setup() {
  
  background(255);
  size(800,800);
  w = new Walker();
  
}

void draw() {
  
  //background(255);
  w.step();
  w.display();
  
}
