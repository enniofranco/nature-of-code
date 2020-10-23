int screenW = 1080/2;
int screenH = 1080/2;

int totalFrames = 480;
int counter = 0;
boolean record = false;

RingSystem ringSystem;

void settings() {
  size(screenW, screenH, FX2D);
  //size(screenW, screenH);
  pixelDensity(displayDensity());
}


void setup() {
  //1. x      //2. y
  //3. min    //4. max
  //5. rings  //6. steps in each circle 
  ringSystem = new RingSystem(width/2, height/2, 5, 60, 150, 60);
}

void draw() {
  float percent = 0;
  if (record) {
    percent = float(counter) / totalFrames;
  } else {
    percent = float(counter % totalFrames) / totalFrames;
  }
  ringSystem.render(percent);
  if (record) {
    saveFrame("output/gif-"+nf(counter, 3)+".png");
    if (counter == totalFrames-1) {
      exit();
    }
  }
  counter++;
}

void render(float percent) {
  background(255, 239, 10);
  stroke(26, 26, 26, 50);
  noFill();
  float a = percent * TWO_PI;
  for (Particle p : particles) {
    p.render(a);
  }
}
