class Field {
  int densityX;
  int densityY;
  float noiseVal;
  float noiseScale;
  Banner[] banners;
  float zoff;

  Field() {
    //densityX = 1440/4;
    //densityY = 900/4;
    densityX = screenW/9;
    densityY = screenH/9;
    int arraySize = int(densityX * densityY);
    banners = new Banner[arraySize];
    noiseScale = 0.03;
    zoff = 0.0;
  }

  void build() {
    for (int x = 0; x < densityX; x++) {
      for (int y = 0; y < densityY; y++) {
        noiseVal = noise(x*noiseScale, y*noiseScale, zoff);
        float rowX = float(width) / (densityX - 1.0);
        float rowY = float(height) / (densityY - 1.0);

        //This option creates a margin around the field. It looks bad now
        //One way to fix it would be to add considerable more margin.
        //I haven't investigated the possibility to add more margin yet.
        //banners[x+y*densityX] = new Banner(rowX + rowX*x, rowY + rowY*y);

        //In this option, the banners are on the edges of the artboard.
        //It works better than the strange margin of the above
        //banners[x+y*densityX] = new Banner(rowX*x, rowY*y, 6);
        banners[x+y*densityX] = new Banner(rowX*x, rowY*y, 9);
        banners[x+y*densityX].render(noiseVal);
      }
    }
    zoff += 0.003;
  }
}
