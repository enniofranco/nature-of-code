Mover[] movers1 = new Mover[1000];
Attractor a1;

Mover[] movers2 = new Mover[500];
Attractor a2;

void setup() {
  size(1000, 1000);
  pixelDensity(displayDensity());
  for (int i = 0; i < movers1.length; i++) {
    movers1[i] = new Mover(1,random(-20, 0),random(-100, 390), 4, 0);
  }
  a1 = new Attractor(100, 400);
  for (int i = 0; i < movers2.length; i++) {
    movers2[i] = new Mover(1,random(1100, 1250),random(-50, 500), -4, 0);
  }
  a2 = new Attractor(800, 600);
}

void draw() {
  //background(100);
  
  a1.drag();
  a1.hover(mouseX, mouseY);
  //a.render();
  
  for (int i = 0; i < movers1.length; i++) {
    PVector force = a1.attract(movers1[i]);
    movers1[i].applyForce(force);
    movers1[i].update();
    movers1[i].render();
  }
  for (int i = 0; i < movers2.length; i++) {
    PVector force = a2.attract(movers2[i]);
    movers2[i].applyForce(force);
    movers2[i].update();
    movers2[i].render();
  }
  
}

void mousePressed() {
  a1.clicked(mouseX, mouseY);
}

void mouseReleased() {
  a1.stopDragging();
}
