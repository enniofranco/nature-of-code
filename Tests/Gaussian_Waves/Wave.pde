class Wave {
  float x;
  float xInc;
  float standardDeviation;
  float standardDeviationOff;
  float mean;
  float meanOff;
  Line[] lines;

  Wave() {
    x = 0;
    xInc = 2;
    standardDeviationOff = random(10);
    meanOff = random(10);
    lines = new Line[400];
    for (int i = 0; i < lines.length; i++) {
      lines[i] = new Line(x);
      x += xInc;
    }
  }

  void calculate() {
    float tempMeanOff = meanOff;
    float tempStandardDeviationOff = standardDeviationOff;
    for (int i = 0; i < lines.length; i++) {
      standardDeviation = map(noise(tempStandardDeviationOff), 0, 1, 1, 100);
      mean = map(noise(tempMeanOff), 0, 1, -300, height+300);
      lines[i].setStandardDeviation(standardDeviation);
      lines[i].setMean(mean);
      lines[i].calculate();
      tempMeanOff += 0.001;
      tempStandardDeviationOff += 0.02;
    }
    meanOff += 0.01;
    standardDeviationOff += 0.05;
  }

  void render() {
    for (int i = 0; i < lines.length; i++) {
      lines[i].render();
    }
  }
}
