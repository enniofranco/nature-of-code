class Stripe {
  float angle;
  float velocity;
  PVector amplitude;
  int nodes;
  float nodeSize;

  float ampXinc;
  float ampYinc;

  Stripe() {
    angle = 0;
    velocity = -0.05;
    amplitude = new PVector(200, 40);

    nodes = 4;
    nodeSize = 16;
  }

  void update() {
    angle += velocity;
  }

  void render() {
    for (int i = 0; i < nodes; i++) {
      renderNode(angle, amplitude, i);
    }
  }

  void renderNode(float _angle, PVector _amplitude, int _i) {
    //Partially works
    //Can't make it work with negative distances between nodes
    float ampX = (_amplitude.x - (nodeSize * nodes)) / (nodes - 0.5);
    float ampY = (_amplitude.y - (nodeSize * nodes)) / (nodes - 0.5);
    println(ampY);
    if (_i == 0) {
      ampXinc = ampX * 0.5;
      ampYinc = ampY * 0.5;
    } else {
      ampXinc += ampX;
      ampYinc += ampY;
    }
    float x1 = sin(_angle) * ampXinc;
    float y1 = cos(_angle) * ampYinc;
    float x2 = sin(_angle+PI) * ampXinc;
    float y2 = cos(_angle+PI) * ampYinc;
    pushMatrix();
    translate(width/2, height/2);
    noStroke();
    fill(100, 100);
    ellipse(x1, y1, nodeSize, nodeSize);
    ellipse(x2, y2, nodeSize, nodeSize);
    popMatrix();
  }
}
