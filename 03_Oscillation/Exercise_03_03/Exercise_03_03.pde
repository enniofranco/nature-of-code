Mover satan;

void setup() {
  size(600, 600);
  pixelDensity(displayDensity());
  satan = new Mover(1);
}

void draw() {
  background(200);
  satan.forward();
  if (keyPressed) {
    if (key == 'l' || key == 'L') {
      //Turn to the right
      satan.turnRight();
      println("right");
    } else if (key == 'k' || key == 'K') {
      satan.turnLeft();
      println("left");
    }
  }
  satan.update();
  satan.render();
}
