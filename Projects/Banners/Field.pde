class Field {
  Banner[] banners;
  //How many on a screen
  int densityX;
  int densityY;
  float noiseVal;
  float noiseScale;
  float zoff;
  float zScale;
  float border;
  float flagSize;

  Field() {
    //densityX = 3;
    //densityY = 3;
    densityX = 52;
    densityY = 52;
    int arraySize = int(densityX * densityY);
    banners = new Banner[arraySize];
    noiseScale = 0.02;
    zScale = 0.002;
    zoff = 0.0;
    border = 52;
    flagSize = 9;
  }

  void build() {
    
    //BORDER
    for (int x = 0; x < densityX; x++) {
      for (int y = 0; y < densityY; y++) {
        noiseVal = noise(x*noiseScale, y*noiseScale, zoff);
        float rowX = (float(width) - border*2) / (densityX - 1.0);
        float rowY = (float(height) - border*2) / (densityY - 1.0);
        
        //Call Banner (x, y, size)
        banners[x+y*densityX] = new Banner(rowX*x + border, rowY*y + border, flagSize);
        banners[x+y*densityX].render(noiseVal);
      }
    }
    zoff += zScale;
    
    //NO BORDER
    //for (int x = 0; x < densityX; x++) {
    //  for (int y = 0; y < densityY; y++) {
    //    noiseVal = noise(x*noiseScale, y*noiseScale, zoff);
    //    float rowX = float(width) / (densityX - 1.0);
    //    float rowY = float(height) / (densityY - 1.0);
        
    //    //Call Banner (x, y, size)
    //    banners[x+y*densityX] = new Banner(rowX*x, rowY*y, 9);
    //    banners[x+y*densityX].render(noiseVal);
    //  }
    //}
    //zoff += zScale;
  }
}
