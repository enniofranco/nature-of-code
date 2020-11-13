float sectionWidth;
float sectionWidthRange;
float time;
float sectionHeight;
float columnQuantity;
float yOff;


void setup() {
  size(600, 600);
  //time = 1000;
  columnQuantity = 200;
  sectionHeight = height/columnQuantity;
  sectionWidthRange = 500;
  yOff = 0;
}

void draw() {
  time = 100;
  background(255);
  //noStroke();
  strokeWeight(1);
  stroke(255);

  float y = 0;

  for (int i = 0; i < columnQuantity; i++) {
    float n = noise(time, yOff);
    sectionWidth = map(n, 0, 1, -sectionWidthRange, sectionWidthRange);

    if (n < 0.5) {
      fill(200);
    } else {
      fill(50);
    }

    rectMode(CENTER);
    rect(width/2, y+sectionHeight/2, sectionWidth, sectionHeight);

    time += 0.005;
    y += sectionHeight;
  }
  yOff += 0.01;

}
