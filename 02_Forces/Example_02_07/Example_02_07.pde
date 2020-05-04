Mover[] movers = new Mover[10];
Attractor a;

void setup() {
  size(600, 600);
  pixelDensity(displayDensity());
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(0.1,2),random(width),random(height));
  }
  a = new Attractor();
}

void draw() {
  background(100);
  
  a.render();
  
  for (int i = 0; i < movers.length; i++) {
    PVector force = a.attract(movers[i]);
    movers[i].applyForce(force);
    movers[i].update();
    movers[i].render();
  }
  
}
