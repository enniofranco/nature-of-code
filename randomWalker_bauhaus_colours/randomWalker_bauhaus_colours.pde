RandomWalker r;

void setup() {
  size(395, 832);
  pixelDensity(displayDensity());
  background(26, 25, 24);
  r = new RandomWalker();
}

void draw() {
  r.update();
  r.render();
  
  if (keyPressed) {
    if (key == 's' || key == 'S') {
      save("image_" + frameCount + ".png");
    }
  }
  
}
