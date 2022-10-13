class Mover {

  PVector loc;
  PVector vel;
  PVector acc;
  float maxVel;
  float itemSize;

  Mover() {
    float x = random(width);
    float y = random(height);
    loc = new PVector(x, y);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    itemSize = 24;
  }

  void update() {
    acc = PVector.random2D();
    checkEdges();
    vel.add(acc);
    loc.add(vel);
    vel.limit(25);
  }

  void checkEdges() {
    float rightEdge = width + (itemSize/2);
    float leftEdge = 0 - (itemSize/2);
    float topEdge = 0 - (itemSize/2);
    float bottomEdge = height + (itemSize/2);
    if (loc.x > rightEdge) {
      loc.x = leftEdge;
    } else if (loc.x < leftEdge) {
      loc.x = rightEdge;
    } else if (loc.y < topEdge) {
      loc.y = bottomEdge;
    } else if (loc.y > bottomEdge) {
      loc.y = topEdge;
    }
  }

  void render() {
    noStroke();
    fill(20);
    ellipse(loc.x, loc.y, itemSize, itemSize);
  }
}
