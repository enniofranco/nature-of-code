Mover[] movers = new Mover[1];
PVector gravity;
PVector wind;

void setup() {
  size(900, 600);
  pixelDensity(displayDensity());
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(2, 150, 300);
  }
}

void draw() {
  background(100);
  gravity = new PVector(0, 0.1);
  wind = new PVector(0, 0);
  for (int i = 0; i < movers.length; i++) {
    if (movers[i].pos.x >= 0 && movers[i].pos.x < 300) {
      float windStrength = map(movers[i].pos.x, 0, 300, 0.5, 0);
      wind.set(windStrength, 0);
    }
    movers[i].applyForce(wind);
    movers[i].applyForce(gravity);
    
    movers[i].update();
    movers[i].render();
  }

}
