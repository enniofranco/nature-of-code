//Sometimes a couple of movers will go out of sync compared to others.
//I did some investigation and it seems like they jump a few pixels higher,
//and this is causing them to go out of sync.
//I haven't looked into a solution yet.

Mover[] movers = new Mover[20];

void setup() {
  size(600, 600);
  pixelDensity(displayDensity());
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(0.6, 2), 0, 300);
  }
}

void draw() {
  background(100);

  for (int i = 0; i < movers.length; i++) {
    PVector wind = new PVector(0.01, 0);
    float m = movers[i].mass;
    PVector gravity = new PVector(0, 0.1 * m);
    
    movers[i].applyForce(wind);
    movers[i].applyForce(gravity);
    
    movers[i].update();
    movers[i].render();
  }

}
