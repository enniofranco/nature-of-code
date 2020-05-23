Field astrid;

void setup() {
  size(1440, 900);
  pixelDensity(displayDensity());
  astrid = new Field();
}

void draw() {
  background(#bfbfb3);
  astrid.build();
}

void keyReleased() {
  saveFrame("Export/banner-###.png");
}
