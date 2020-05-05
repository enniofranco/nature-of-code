Mover[] movers = new Mover[16];

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
}

void draw() {
  background(100);

  for (int i = 0; i < movers.length; i++) {
    for (int j = 0; j < movers.length; j++) {
      if (i != j) {
        PVector force = movers[j].attract(movers[i]);
        movers[i].applyForce(force);
      }
    }
    movers[i].update();
    movers[i].render();
  }
}
