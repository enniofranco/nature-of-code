Mover[] movers;
FrictionField frictionField1;
FrictionField frictionField2;

void setup() {
  size(800, 800);
  pixelDensity(displayDensity());
  movers = new Mover[int(random(5, 10))];
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(1, 5), random(width), random(height));
  }
  frictionField1 = new FrictionField(100, 300, 400, 200, 0.1);
  frictionField2 = new FrictionField(300, 300, 400, 200, 0.1);
}

void draw() {
  background(50);
  frictionField1.render();
  frictionField2.render();
  for (int i = 0; i < movers.length; i++) {
    PVector mouse = new PVector(mouseX, mouseY);
    mouse = PVector.sub(mouse, movers[i].loc);
    mouse.setMag(0.2);
    movers[i].applyForce(mouse);
    if (movers[i].isInside(frictionField1)) {
      movers[i].applyFriction(frictionField1);
    }
    if (movers[i].isInside(frictionField2)) {
      movers[i].applyFriction(frictionField2);
    }
    //movers[i].checkEdges();
    movers[i].update();
    movers[i].render();
  }
  
}
