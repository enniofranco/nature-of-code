Walker matilda;

void setup() {
  pixelDensity(displayDensity());
  size(600, 600);
  matilda = new Walker();
}

void draw() {
  matilda.step();
  matilda.render();
}
