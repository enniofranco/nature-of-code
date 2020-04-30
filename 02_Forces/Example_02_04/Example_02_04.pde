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
    float c = 0.05;
    float normal = 1;
    float frictionMag = c * normal;
    PVector friction = movers[i].vel.get();
    friction.mult(-1);
    friction.normalize();
    friction.mult(frictionMag);
    
    PVector wind = new PVector(0.01, 0);
    float m = movers[i].mass;
    PVector gravity = new PVector(0, 0.1 * m);
    
    movers[i].applyForce(friction);
    movers[i].applyForce(wind);
    movers[i].applyForce(gravity);
    
    movers[i].update();
    movers[i].render();
  }

}
