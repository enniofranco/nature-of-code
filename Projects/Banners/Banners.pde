Field astrid;
int screenW = 1350/2;
int screenH = 1350/2;

void settings() {
  size(screenW, screenH);
  pixelDensity(displayDensity());
}

void setup() {
  astrid = new Field();
}

void draw() {
  background(#ecdfb2);
  astrid.build();
  //saveFrame("Export/banner-###.png");
  //rectMode(CENTER);
  //fill(#cca773);
  //rect(width/2, height/2, 400, 400);
}
