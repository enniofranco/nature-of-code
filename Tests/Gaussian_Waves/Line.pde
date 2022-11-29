class Line {
  float x;
  float[] y;
  float mean;
  float standardDeviation;
  float itemSize;
  int itemsPerLine;

  Line(float _x, float _standardDeviation, float _mean) {
    x = _x;
    standardDeviation = _standardDeviation;
    mean = _mean;
    itemSize = 2;
    itemsPerLine = 30;
    y = new float[itemsPerLine];
  }

  void calculate() {
    for (int i = 0; i < itemsPerLine; i++) {
      y[i] = randomGaussian() * standardDeviation;
      y[i] += mean;
    }
  }

  void render() {
    noStroke();
    fill(200, 50);
    for (int i = 0; i < itemsPerLine; i++) {
      ellipse(x, y[i], itemSize, itemSize);
    }
  }
}
