//1080 is Instagram's default media size for squares
//I export the media at displayDensity() which multiplies by 2, thus I get to 1080
int screenW = 1080/2;
int screenH = 1080/2;
int timeRec = 30; //seconds of recording
int fps = 30; //frames per second

Field astrid;

void settings() {
  timeRec = timeRec * fps;
  println(timeRec);
  size(screenW, screenH);
  pixelDensity(displayDensity());
}

void setup() {
  astrid = new Field();
}

void draw() {
  //Background is the same colour as PVector colourBg within Banner
  //I preferred not to use the same colour for changing the background
  //can result in interesting results
  background(#F5F5EE);
  astrid.build();
  //timeRec is converted into number of frames
  if(frameCount <= timeRec) {
    saveFrame("Export/banner-####.png");
  }
}
