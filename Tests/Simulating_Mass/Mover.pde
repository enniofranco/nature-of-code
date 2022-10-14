class Mover {

  PVector loc;
  PVector vel;
  PVector acc;
  float mass;

  float itemSize;

  Mover() {
    mass = random(1 ,5);
    itemSize = 8 * mass;
    float randomX = random(0, width);
    //float randomY = random(0, width);
    float randomY = height/2;
    loc = new PVector(randomX, randomY);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
  }

  void update() {
    vel.add(acc);
    loc.add(vel);
    //vel.limit(5);
    acc.mult(0);
  }

  void render() {
    noStroke();
    fill(20);
    ellipse(loc.x, loc.y, itemSize, itemSize);
  }

  void applyForce(PVector _force) {
    PVector _f = PVector.div(_force, mass);
    acc.add(_f);
  }

  void checkEdges() {
    float bottomEdge = height - itemSize/2;
    float topEdge = 0 + itemSize/2;
    float rightEdge = width - itemSize/2;
    float leftEdge = 0 + itemSize/2;
    
    /* Because items have different heights,
    it will make them bounce at different moments,
    and they won't fall at the same time after the first time.
    To compare, it's better to use the if below*/
    //if(loc.y > bottomEdge) {
    //  loc.y = bottomEdge;
    //  vel.y *= -1;
    //} else if (loc.x > rightEdge) {
    //  loc.x = rightEdge;
    //  vel.x *= -1;
    //} else if (loc.x < leftEdge) {
    //  loc.x = leftEdge;
    //  vel.x *= -1;
    //}
    if(loc.y > height) {
      loc.y = height;
      vel.y *= -1;
    } else if (loc.x > rightEdge) {
      loc.x = rightEdge;
      vel.x *= -1;
    } else if (loc.x < leftEdge) {
      loc.x = leftEdge;
      vel.x *= -1;
    }
  }
}
