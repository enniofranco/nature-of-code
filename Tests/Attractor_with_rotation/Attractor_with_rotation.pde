Satellite[] satellites = new Satellite[16];
Attractor attractor;
float G = 1;

void setup() {
  size(600, 600, FX2D);
  
  for (int i = 0; i < satellites.length; i++) {
    satellites[i] = new Satellite(random(0.1, 2), random(width), random(height));
  }
  attractor = new Attractor();
}

void draw() {
  background(200);
  
  attractor.render();
  
  for (int i = 0; i < satellites.length; i++) {
    for (int j = 0; j < satellites.length; j++) {
      if (i != j) {
        PVector force = satellites[j].attract(satellites[i]);
        satellites[i].applyForce(force);
      }
    }
    PVector force2 = attractor.attract(satellites[i]);
    satellites[i].applyForce(force2);
    satellites[i].update();
    satellites[i].render();
  }
}
