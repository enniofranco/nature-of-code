Mover[] movers = new Mover[16];
Attractor a;

//Shiffman puts the variable for gravity G on the main sketch
//and references it on the Mover class.
//It works. I suppose that since the variable is declared here
//it will be available to the whole program
float G = 1;

void setup() {
  size(600, 600);
  pixelDensity(displayDensity());
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(0.1, 2), random(width), random(height));
  }
  a = new Attractor();
}

void draw() {
  background(100);
  
  a.drag();
  a.hover(mouseX, mouseY);
  a.render();

  for (int i = 0; i < movers.length; i++) {
    for (int j = 0; j < movers.length; j++) {
      if (i != j) {
        PVector force = movers[j].attract(movers[i]);
        movers[i].applyForce(force);
      }
    }
    PVector force2 = a.attract(movers[i]);
    movers[i].applyForce(force2);
    
    movers[i].update();
    movers[i].render();
  }
}

void mousePressed() {
  a.clicked(mouseX, mouseY);
}

void mouseReleased() {
  a.stopDragging();
}
