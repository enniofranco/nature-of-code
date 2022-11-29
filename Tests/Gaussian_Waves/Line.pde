class Line {
  float x;
  float[] y;
  float mean;
  float standardDeviation;
  float itemSize;
  int itemsPerLine;
  float colorAlpha;

  Line(float _x) {
    x = _x;
    itemSize = 2;
    itemsPerLine = 35;
    y = new float[itemsPerLine];
    colorAlpha = random(30,60);
  }

  void calculate() {
    for (int i = 0; i < itemsPerLine; i++) {
      y[i] = randomGaussian() * standardDeviation;
      y[i] += mean;
    }
  }

  void render() {
    noStroke();
    color grey = #F5F5EE;
    fill(grey, colorAlpha);
    for (int i = 0; i < itemsPerLine; i++) {
      ellipse(x, y[i], itemSize, itemSize);
    }
  }
  
  void setMean(float _mean) {
    mean = _mean;
  }
  
  void setStandardDeviation(float _standardDeviation) {
    standardDeviation = _standardDeviation;
  }
}
