class Walker {
  float x, y;
  PVector step;
  float walkerSize;

  Walker() {
    //Calculate central area
    float x1 = width/4;
    float x2 = x1 * 3;
    float y1 = height/4;
    float y2 = y1 * 3;
    float randomX = random(x1, x2);
    float randomY = random(y1, y2);
    x = randomX;
    y = randomY;
    walkerSize = random(4, 32);
  }

  void calculate() {
    float r = random(1);
    if(r < 0.4) {
      y--;
    } else if(r < 0.6) {
      x++;
    } else if(r < 0.8) {
      y++;
    } else {
      x--;
    }
  }

  void render() {
    fill(0);
    noStroke();
    ellipse(x, y, walkerSize, walkerSize);
  }
}
