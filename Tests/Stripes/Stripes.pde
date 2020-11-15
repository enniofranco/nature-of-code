//Still doesn't feel like it's rotating
//But it is a working version

float angle;
float sectionMaxWidth;
float time;
float sectionHeight;
float columnQuantity;
float yOff;

color colour1a, colour1b;

Stripe stripe;


void setup() {
  size(600, 600, FX2D);
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
    angle = map(n, 0, 1, 0, TWO_PI);
    //println(angle);

    stripe = new Stripe(width/2, y, sectionMaxWidth, sectionHeight, angle);

    time += 0.012;
    y += sectionHeight;
  }

  yOff += 0.0008;
}
