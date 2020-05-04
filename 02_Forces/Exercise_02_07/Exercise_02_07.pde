Mover[] movers = new Mover[1];

void setup() {
  size(600, 600);
  pixelDensity(displayDensity());

  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(1, 30, height-1);
  }
}

void draw() {
  background(100);

  for (int i = 0; i < movers.length; i++) {

    //GRAVITY
    //This is Shiffman's hacky way of adding gravity
    //It's a constant * object's mass. The constant in our case is set to 0.1
    float m = 0.1 * movers[i].mass; 
    PVector gravity = new PVector(0, m);
    movers[i].applyForce(gravity);

    //DRAG
    float speed = movers[i].vel.mag();
    float dragMagnitude = 0.01 * speed * speed;

    PVector drag = movers[i].vel.copy();
    drag.mult(-1);
    drag.normalize();
    drag.mult(dragMagnitude);

    movers[i].applyForce(drag);
    
    if (mousePressed) {
      PVector runwayAcc = new PVector (1.5, 0);
      movers[i].applyForce(runwayAcc);
      PVector dragLift = new PVector(0, dragMagnitude * -1 * 0.2);
      movers[i].applyForce(dragLift);
    }

    //UPDATE AND RENDER
    movers[i].update();
    movers[i].render();
  }
}
