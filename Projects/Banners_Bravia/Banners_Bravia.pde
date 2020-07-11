//1080 is Instagram's default media size for squares
//I export the media at displayDensity() which multiplies by 2, thus I get to 1080
//int screenW = 1080/2;
//int screenH = 1080/2;
int screenW = 1920/2;
int screenH = 1080/2;
int timeRec = 30; //seconds of recording
int fps = 30; //frames per second
boolean isRecording;

Field astrid;

void settings() {
  fullScreen();
  timeRec = timeRec * fps;
  size(screenW, screenH);
  pixelDensity(displayDensity());
  isRecording = false;
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

  //Record all frames
  //saveFrame("Export/banner-####.png");

  //Record based on time
  //timeRec is converted into number of frames
  //if(frameCount <= timeRec) {
  //  saveFrame("Export/banner-####.png");
  //}

  if (isRecording) {
    saveFrame("Export/banner-####.png");
  }
}

void keyPressed() {
  if (key == 'r' || key == 'R') {
    isRecording = !isRecording;
  }
}
