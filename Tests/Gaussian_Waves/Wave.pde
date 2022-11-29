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
    xInc = 1;
    standardDeviationOff = random(10);
    float tempStandardDeviationOff = standardDeviationOff;
    meanOff = random(10);
    float tempMeanOff = meanOff;
    lines = new Line[800];
    for (int i = 0; i < lines.length; i++) {
      standardDeviation = map(noise(tempStandardDeviationOff), 0, 1, 1, 100);
      mean = map(noise(tempMeanOff), 0, 1, -300, height+300);
      lines[i] = new Line(x, standardDeviation, mean);
      x += xInc;
      tempMeanOff += 0.001;
      tempStandardDeviationOff += 0.01;
    }
  }

  void calculate() {
    meanOff += 0.01;
    float tempMeanOff = meanOff;
    standardDeviationOff += 0.05;
    float tempStandardDeviationOff = standardDeviationOff;
    for (int i = 0; i < lines.length; i++) {
      lines[i].calculate();
      lines[i].mean = map(noise(tempMeanOff), 0, 1, -300, height+300);
      tempMeanOff += 0.001;
      lines[i].standardDeviation = map(noise(tempStandardDeviationOff), 0, 1, 1, 120);
      tempStandardDeviationOff += 0.015;
    }
  }

  void render() {
    for (int i = 0; i < lines.length; i++) {
      lines[i].render();
    }
  }
}
