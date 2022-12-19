Mover[] movers;
FrictionField[] frictionFields;

void setup() {
  size(800, 800);
  pixelDensity(displayDensity());
  movers = new Mover[int(random(5, 10))];
  movers = new Mover[1];
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(1, 5), random(width), random(height));
  }
  frictionFields = new FrictionField[int(random(1, 5))];
  for (int i = 0; i < frictionFields.length; i++) {
    float fieldW = random(20, width/3);
    float fieldH = random(20, height/3);
    float fieldX = random(0, width - fieldW);
    float fieldY = random(0, height - fieldH);
    frictionFields[i] = new FrictionField(fieldX, fieldY, fieldW, fieldH);
  }
}

void draw() {
  background(50);
  for (int i = 0; i < frictionFields.length; i++) {
    frictionFields[i].render();
  }

  for (int i = 0; i < movers.length; i++) {
    PVector mouse = new PVector(mouseX, mouseY);
    mouse = PVector.sub(mouse, movers[i].loc);
    mouse.setMag(0.2);
    movers[i].applyForce(mouse);
    for (int j = 0; j < frictionFields.length; j++) {
      PVector friction = frictionFields[j].applyFriction(movers[i]);
      movers[i].applyForce(friction);
      //println(friction);
    }
    //movers[i].checkEdges();
    movers[i].update();
    movers[i].render();
  }
  
  //println("NEW");
}
