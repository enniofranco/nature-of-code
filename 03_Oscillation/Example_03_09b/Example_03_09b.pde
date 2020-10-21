Particle[] particles1, particles2;

void setup() {
  size(600, 600);
  particles1 = new Particle[200];
  particles2 = new Particle[200];
  for(int i = 0; i < particles1.length; i++) {
    particles1[i] = new Particle(i*10, 100, i*0.2, 0.02, 20);
  }
  for(int i = 0; i < particles2.length; i++) {
    particles2[i] = new Particle(i*10, 200, i*0.3, 0.04, 50);
  }
}

void draw() {
  background(200);
  for(int i = 0; i < particles1.length; i++) {
    particles1[i].update();
    particles1[i].render();
  }
  for(int i = 0; i < particles2.length; i++) {
    particles2[i].update();
    particles2[i].render();
  }
}
