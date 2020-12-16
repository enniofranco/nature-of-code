MCQBColours mcqbColours;
ParticleCluster particleCluster;

void setup() {
  mcqbColours = new MCQBColours();
  size(600, 600);
  particleCluster = new ParticleCluster(random(width), random(height));
}

void draw() {
  background(mcqbColours.cGree);
  particleCluster.go();
}
