class Field {
  int densityX;
  int densityY;
  float noiseVal;
  float noiseScale;
  Banner[] banners;

  Field() {
    densityX = 50;
    densityY = 50;
    int arraySize = int(densityX * densityY);
    banners = new Banner[arraySize];
    noiseScale = 0.02;
  }

  void build() {
    for (int x = 0; x < densityX; x++) {
      for (int y = 0; y < densityY; y++) {
        noiseVal = noise(x*noiseScale, y*noiseScale);
        float rowX = float(width) / (densityX + 1.0);
        float rowY = float(height) / (densityY + 1.0);
        banners[x+y*densityX] = new Banner(rowX + rowX*x, rowY + rowY*y);
        banners[x+y*densityX].render(noiseVal);
      }
    }
  }
}
