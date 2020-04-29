//THIS IS NOT A GOOD SOLUTION

Mover tamara;

void setup() {
  size(600, 600);
  pixelDensity(displayDensity());
  tamara = new Mover();
}

void draw() {
  PVector baloon = new PVector(0, -0.2);
  tamara.applyForce(baloon);
  PVector wind = new PVector(0.01, 0);
  tamara.applyForce(wind);

  background(100);
  tamara.update();
  tamara.render();
}
