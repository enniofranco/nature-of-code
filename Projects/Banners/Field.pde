class Field {
  Banner[] banners;
  int densityX;
  int densityY;
  float noiseVal;
  float noiseScale;
  float zoff;
  float zScale;

  Field() {
    //densityX = 3;
    //densityY = 3;
    densityX = screenW/9;
    densityY = screenH/9;
    int arraySize = int(densityX * densityY);
    banners = new Banner[arraySize];
    noiseScale = 0.02;
    zScale = 0.002;
    zoff = 0.0;
  }

  void build() {
    for (int x = 0; x < densityX; x++) {
      for (int y = 0; y < densityY; y++) {
        noiseVal = noise(x*noiseScale, y*noiseScale, zoff);
        float rowX = float(width) / (densityX - 1.0);
        float rowY = float(height) / (densityY - 1.0);
        
        //In this option, the banners are on the edges of the artboard.
        //It works better than the strange margin of the above
        banners[x+y*densityX] = new Banner(rowX*x, rowY*y, 9);
        banners[x+y*densityX].render(noiseVal);
      }
    }
    zoff += zScale;
  }
}
