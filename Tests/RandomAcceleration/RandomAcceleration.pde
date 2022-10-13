Mover matilda;

void setup() {
  size(640, 640);
  pixelDensity(displayDensity());
  matilda = new Mover();
}

void draw() {
  noStroke();
  fill(230, 5);
  rect(0, 0, width, height);
  matilda.update();
  matilda.render();
}
