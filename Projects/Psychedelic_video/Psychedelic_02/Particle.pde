class Particle {
  MCQBColours mcqbColours;
  PVector pos;
  float upIncrement;
  float anchorX, anchorY;
  float radius;

  Particle(float _anchorX, float _anchorY) {
    mcqbColours = new MCQBColours();
    anchorX = _anchorX;
    anchorY = _anchorY;
    radius = random(20, 50);
    pos = new PVector(random(anchorX-radius, anchorX+radius), random(anchorY-radius, anchorY+radius));
    upIncrement = random(3, 5);
  }

  void step() {
    //Choose a random number
    float r = random(1);
    //Use random number to determine direction
    //For it to go right and down
    if (r < 0.7) {
      pos.y -= upIncrement;
    } else if (r < 0.8) {
      pos.x++;
    } else if (r < 0.9) {
      pos.x--;
    } else {
      pos.y++;
    }
  }

  void render() {
    noStroke();
    fill(mcqbColours.cWhit, 190);
    ellipse(pos.x, pos.y, 12*random(0.5, 1.2), 12*random(0.5, 1.2));
  }
}
