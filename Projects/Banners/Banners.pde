Field astrid;

void setup() {
  size(1440, 900);
  pixelDensity(displayDensity());
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
