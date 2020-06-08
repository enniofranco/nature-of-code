class NodeMaster {
  Node[][] nodes;
  int densityX, densityY, densityZ;
  PVector noiseNodeOff;
  float noiseFieldOff;
  float noiseScale;
  float noiseNodeOffInc;
  float zoff;
  PVector colour1A, colour1B, colour2A, colour2B;

  NodeMaster(int _densityX, int _densityY, int _densityZ, float _x, float _y) {
    densityX = _densityX;
    densityY = _densityY;
    densityZ = _densityZ;
    int arraySize = densityX * densityY;
    nodes = new Node[densityZ][arraySize];
    noiseScale = 0.02;
    noiseNodeOffInc = 0.05;
    zoff = 0;

    colour1A = new PVector(255, 10, 79);
    colour2A = new PVector(255, 100, 10);
    colour1B = new PVector(255, 239, 10);
    colour2B = new PVector(0, 184, 31);

    float shapeSizeX = 4*densityX + (densityZ*2);
    float shapeSizeY = 4*densityY + (densityZ*2);
    _x = _x - shapeSizeX/2;
    _y = _y - shapeSizeY/2;

    for (int z = 0; z < densityZ; z++) {
      for (int x = 0; x < densityX; x++) {
        for (int y = 0; y < densityY; y++) {
          float _nodeX = (4*x+(z*2)) + _x;
          float _nodeY = (4*y+(z*2)) + _y;
          PVector pos = new PVector(_nodeX, _nodeY);
          nodes[z][x+y*densityX] = new Node(pos, 40);
        }
      }
    }
    noiseNodeOff = new PVector(10, 10000);
  }

  void update() {
    float _zoff = 0;
    for (int z = 0; z < densityZ; z++) {
      float _R1z = map(z, 0, densityZ, colour1A.x, colour1B.x);
      float _G1z = map(z, 0, densityZ, colour1A.y, colour1B.y);
      float _B1z = map(z, 0, densityZ, colour1A.z, colour1B.z);
      float _R2z = map(z, 0, densityZ, colour2A.x, colour2B.x);
      float _G2z = map(z, 0, densityZ, colour2A.y, colour2B.y);
      float _B2z = map(z, 0, densityZ, colour2A.z, colour2B.z);

      for (int x = 0; x < densityX; x++) {
        for (int y = 0; y < densityY; y++) {
          float _R = map(y, 0, densityY, _R1z, _R2z);
          float _G = map(y, 0, densityY, _G1z, _G2z);
          float _B = map(y, 0, densityY, _B1z, _B2z);
          fill(_R, _G, _B, 255);
          noiseFieldOff = noise(x*noiseScale, y*noiseScale, zoff + _zoff);
          float fieldOff = map(noiseFieldOff, 0, 1, 0, 0.5);
          float noiseX = noise(noiseNodeOff.x + fieldOff);
          float noiseY = noise(noiseNodeOff.y + fieldOff);
          nodes[z][x+y*densityX].update(noiseX, noiseY);
          nodes[z][x+y*densityX].render();
        }
      }
      _zoff += 0.2;
    }
    noiseNodeOff.add(0.001, 0.001);
    zoff += 0.05;
  }
}
