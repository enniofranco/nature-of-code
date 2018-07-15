//I'm not yet sure how to verify
//if this exercise is correct or not

float x;
float y;
Walker w;

void setup() {
  
  background(255);
  //frameRate(10);
  size(800,800);
  w = new Walker();
  
}

void draw() {
  
  w.step();
  w.display();
  
}
