//Still doesn't feel like it's rotating
//But it is a working version

float sectionWidth;
float sectionWidthRange;
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
  sectionWidthRange = 500;
  yOff = 0;
}

void draw() {
  time = 100;
  background(245, 245, 238);

  float y = 0;

  for (int i = 0; i < columnQuantity; i++) {
    float n = noise(time, yOff);
    sectionWidth = map(n, 0, 1, -sectionWidthRange, sectionWidthRange);

    if (n < 0.5) {
      colour1a = color(0, 184, 31); 
      colour1b = color(4, 28, 224);
    } else {
      colour1a = color(140, 140, 140); 
      colour1b = color(26, 26, 26);
    }

    //rectMode(CENTER);
    //rect(width/2, y+sectionHeight/2, sectionWidth, sectionHeight);
    stripe = new Stripe(width/2, y, sectionWidth, sectionHeight, colour1a, colour1b);


    time += 0.01;
    y += sectionHeight;
  }

  yOff += 0.001;
}
