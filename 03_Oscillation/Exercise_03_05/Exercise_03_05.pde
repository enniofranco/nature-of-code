Mover thing;

void setup() {
  size(600, 600);
  pixelDensity(displayDensity());
  thing = new Mover();
}

void draw() {
  background(200);
  
  if (keyPressed) {
    if (key == CODED && keyCode == RIGHT) {
      thing.turn(0.04);
    } else if (key == CODED && keyCode == LEFT) {
      thing.turn(-0.04);
    } else if (key == 'a' || key == 'A') {
      thing.thrust();
    }
  }
  thing.update();
  thing.render();
}
