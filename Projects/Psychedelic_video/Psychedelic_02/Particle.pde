class Particle {
  MCQBColours mcqbColours;
  PVector pos;
  float upIncrement;
  float anchorX, anchorY;
  float radius;
  int lifeSpam;
  int renderShape;
  float shapeSize;

  Particle(float _anchorX, float _anchorY) {
    mcqbColours = new MCQBColours();
    anchorX = _anchorX;
    anchorY = _anchorY;
    radius = random(20, 80);
    pos = new PVector(random(anchorX-radius, anchorX+radius), random(anchorY-radius, anchorY+radius));
    upIncrement = random(1, 3);
    lifeSpam = int(random(120, 250));
    renderShape = 0;
    shapeSize = 11;
  }

  void step() {
    float r = random(1);
    //Use random number to determine direction
    //For it to go right and down
    if (r < 0.7) {
      pos.y -= upIncrement;
    } else if (r < 0.8) {
      pos.x += 2;
    } else if (r < 0.9) {
      pos.x -= 2;
    } else {
      pos.y += 1;
    }
  }

  void render() {
    noStroke();
    fill(mcqbColours.cBlac, 190);
    if(renderShape < lifeSpam) {
      render1();
      renderShape++;
    } else {
      render2();
      shapeSize += 0.02;
    }
  }
  
  void render1() {
    ellipse(pos.x, pos.y, shapeSize*random(0.5, 1.2), shapeSize*random(0.5, 1.2));
  }
  
  void render2() {
    rectMode(CENTER);
    rect(pos.x, pos.y, shapeSize*random(0.5, 1.2), shapeSize*random(0.5, 1.2));
    rectMode(CORNER);
  }
}
