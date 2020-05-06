/*
The current state of the sketch makes it look like it's a car drifting on ice
Maybe if I add friction, it could make it look better.
There's no friction so it seems like it makes sense to drift.
*/

Mover m;

void setup() {
  size(600, 600);
  pixelDensity(displayDensity());
  m = new Mover();
}

void draw() {
  PVector force = new PVector (cos(m.heading), sin(m.heading));
  force.mult(0.1);
  m.applyForce(force);
  
  background(200);
  
  if (keyPressed) {
    if (key == CODED && keyCode == RIGHT) {
      m.turn(0.04);
    } else if (key == CODED && keyCode == LEFT) {
      m.turn(-0.04);
    }
  }
  
  m.update();
  m.render();
}
