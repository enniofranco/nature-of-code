class Shape {
  MCQBColours mcqbColours;
  int vertexNumberOf;
  float radius;
  float anchorX;
  float anchorY;
  float theta;

  Shape() {
    mcqbColours = new MCQBColours();
    vertexNumberOf = int(random(3, 13));
    radius = 87;
    anchorX = random(width/2-25, width/2+25);
    anchorY = random(height/2-25, height/2+25);
    theta = TWO_PI/vertexNumberOf;
  }

  void go() {
    if (frameCount % 20 == 0) {
      if (vertexNumberOf > 5) { //must be at least 5 vertex to substract 2
        vertexNumberOf += int(random(-3, 3));
        theta = TWO_PI/vertexNumberOf;
      } else {
        vertexNumberOf += int(random(3));
        theta = TWO_PI/vertexNumberOf;
      }
    }

    if (frameCount % 16 == 0) {
      anchorX += random(-4, 4);
      anchorY += random(-4, 4);
    }


    display();
  }

  void display() {
    float _theta = theta;
    fill(mcqbColours.cGree);
    beginShape();
    for (int i = 0; i < vertexNumberOf; i++) {
      float x = cos(_theta) * radius + anchorX;
      float y = sin(_theta) * radius + anchorY;
      vertex(x, y);
      _theta += theta;
    }
    endShape();
  }
}
