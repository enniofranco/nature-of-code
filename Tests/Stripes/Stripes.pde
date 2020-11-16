//I declare this version a failure
//I don't like the way it looks and I don't feel like it is interesting
//I will try again with different steps
int screenW = 1080/2;
int screenH = 1080/2;
boolean isRecording;

float angle;
float sectionMaxWidth;
float time;
float sectionHeight;
float columnQuantity;
float yOff;

color colour1a, colour1b;

Stripe stripe;

void settings() {
  size(screenW, screenH, FX2D);
  pixelDensity(displayDensity());
  isRecording = false;
}

void setup() {
  //size(600, 600, FX2D);
  //time = 1000;
  columnQuantity = 100;
  sectionHeight = height/columnQuantity;
  sectionMaxWidth = 300;
  yOff = 0;
}

void draw() {
  time = 100;
  background(245, 245, 238);

  float y = 0;

  for (int i = 0; i < columnQuantity; i++) {
    float n = noise(time, yOff);
    angle = map(n, 0, 1, PI/2, ((TWO_PI*2)+(PI/2)));
    println(degrees(angle));

    stripe = new Stripe(width/2, y, sectionMaxWidth, sectionHeight, angle);

    time += 0.012;
    y += sectionHeight;
  }

  yOff += 0.0008;

  if (isRecording) {
    saveFrame("Export/stripe-####.png");
  }
}

void keyPressed() {
  if (key == 'r' || key == 'R') {
    isRecording = !isRecording;
  }
}
