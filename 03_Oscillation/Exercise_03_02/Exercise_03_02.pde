//DONT KNOW HOW TO DO THE ANGLE CORRECTLY

Mover c;

void setup() {
  size(600, 600);
  pixelDensity(displayDensity());
  c = new Mover(1, 50, 300);
}

void draw() {
  background(100);
  PVector gravity = new PVector(0, 0.5 * c.mass);
  c.applyForce(gravity);

  //DRAG FORCE
  float speed = c.vel.mag();
  //0.1 is the coefficient of drag
  float dragMagnitude = 0.005 * speed * speed;
  PVector drag = c.vel.copy();
  drag.mult(-1);
  drag.normalize();
  drag.mult(dragMagnitude);

  c.applyForce(drag);

  if (keyPressed) {
    if (key == 'b' || key == 'B') {
      PVector cannon = new PVector(15, -25);
      c.applyForce(cannon);
    }
  }

  c.update();
  c.render();
}
