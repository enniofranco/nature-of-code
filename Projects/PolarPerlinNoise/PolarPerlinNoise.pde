//It's working but the noise is ugly and it's not moving the way I want

int screenW = 1080/2;
int screenH = 1080/2;

RingSystem ringSystem;

void settings() {
  //size(screenW, screenH, FX2D);
  size(screenW, screenH);
  pixelDensity(displayDensity());
}


void setup() {
  //1. x      //2. y
  //3. min    //4. max
  //5. rings  //6. steps in each circle 
  ringSystem = new RingSystem(width/2, height/2, 5, 60, 200, 180);
}

void draw() {
  background(200);
  ringSystem.render();
}
