ParticleSystem systemA;

void setup() {
  size(600, 600);
  systemA = new ParticleSystem(width/2, height/2, 50, 100, 10, 16);
}

void draw() {
  background(26, 26, 26);
  systemA.render();
  noLoop(); 
}
