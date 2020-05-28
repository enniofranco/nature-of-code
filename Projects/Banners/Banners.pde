Field astrid;
//int screenW = 1350/2;
//int screenH = 1350/2;
int screenW = 540;
int screenH = 540;

void settings() {
  size(screenW, screenH);
  pixelDensity(displayDensity());
}

void setup() {
  astrid = new Field();
}

void draw() {
  //background(#8C8C8C);
  background(#F5F5EE);
  astrid.build();
  //saveFrame("Export/banner-###.png");
  //rectMode(CENTER);
  //fill(#2F47EB);
  //rect(width/2, height/2, width/3, height/3);
}
