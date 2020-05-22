Field astrid;

void setup() {
  size(600, 600);
  pixelDensity(displayDensity());
  astrid = new Field();
}

void draw() {
  background(200);
  astrid.build();
}
