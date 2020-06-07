class NodeMaster {
  Node[] nodes;
  int densityX, densityY;
  PVector noiseNodeOff;
  float noiseFieldOff;
  float noiseScale;
  float noiseNodeOffInc;

  NodeMaster() {
    densityX = 24;
    densityY = 24;
    int arraySize = densityX * densityY;
    nodes = new Node[arraySize];
    noiseScale = 0.1;
    noiseNodeOffInc = 0.05;

    for (int x = 0; x < densityX; x++) {
      for (int y = 0; y < densityY; y++) {
        float offset = 100;
        float _x = 6*x + offset;
        float _y = 6*y + offset;
        PVector pos = new PVector(_x, _y);
        nodes[x+y*densityX] = new Node(pos, 100);
      }
    }
    noiseNodeOff = new PVector(10, 10000);
  }

  void update() {
    for (int x = 0; x < densityX; x++) {
      for (int y = 0; y < densityY; y++) {
        noiseFieldOff = noise(x*noiseScale, y*noiseScale);
        float fieldOff = map(noiseFieldOff, 0, 1, 0, 0.5);
        float noiseX = noise(noiseNodeOff.x + fieldOff);
        float noiseY = noise(noiseNodeOff.y + fieldOff);
        nodes[x+y*densityX].update(noiseX, noiseY);
        nodes[x+y*densityX].render();
      }
    }
    noiseNodeOff.add(0.01, 0.01);
  }
}
