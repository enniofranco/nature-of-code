Mover m;
float t;

void setup() {
  size(800,800);
  m = new Mover();
  t = 1000;
}

void draw() {
  
  float perlin = map(noise(t), 0, 1, -0.1, 0.1);
  background(200);
  PVector wind = new PVector(perlin, 0);
  m.applyForce(wind);
  PVector gravity = new PVector(0,-0.1);
  m.applyForce(gravity);
  
  m.update();
  m.edges();
  m.display();
  
  t += 0.01;
  
}
