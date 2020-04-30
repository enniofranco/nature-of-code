Mover[] movers = new Mover[7];

void setup() {
  size(600, 600);
  pixelDensity(displayDensity());
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(0.6, 2), random(width), 300);
  }
}

void draw() {
  background(100);

  for (int i = 0; i < movers.length; i++) {

    //FRICTION
    float fc = 0.06;
    PVector friction = movers[i].vel.copy();
    friction.mult(-1);
    friction.normalize();
    friction.mult(fc);

    //UNFRICTION
    float uc = 0.05;
    PVector unfriction = movers[i].vel.copy();
    unfriction.normalize();
    unfriction.mult(uc);

    PVector wind = new PVector(0.01, 0);
    float m = movers[i].mass;
    PVector gravity = new PVector(0, 0.1 * m);

    if (movers[i].pos.y < height/2) {
      fill(0, 30);
      rect(0, 0, width, height/2);
      movers[i].applyForce(friction);
    } else {
      movers[i].applyForce(unfriction);
    }
    //movers[i].applyForce(wind);
    movers[i].applyForce(gravity);

    movers[i].update();
    movers[i].render();
  }
}
