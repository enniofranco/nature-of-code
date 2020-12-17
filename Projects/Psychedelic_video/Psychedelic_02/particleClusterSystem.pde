class ParticleClusterSystem {
  ParticleCluster[] particleCluster;
  int particleClusterNumberOf;

  ParticleClusterSystem(int _particleClusterNumberOf) {
    particleClusterNumberOf = _particleClusterNumberOf;
    particleCluster = new ParticleCluster[particleClusterNumberOf];
    for (int i = 0; i < particleClusterNumberOf; i++) {
      float x = random(width);
      float y = random(height+100, height+300);
      particleCluster[i] = new ParticleCluster(x, y);
    }
  }

  void go() {
    for (int i = 0; i < particleClusterNumberOf; i++) {
      particleCluster[i].go();
    }
  }
}
