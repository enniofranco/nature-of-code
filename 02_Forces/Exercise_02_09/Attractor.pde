class Attractor {
  PVector pos;
  float mass;
  float G;
  //MOUSE INTERACTION VARIABLES
  boolean dragging = false; // Is the object being dragged?
  boolean rollover = false; // Is the mouse over the ellipse?
  PVector dragOffset;  // holds the offset for when object is clicked on

  Attractor() {
    pos = new PVector(width/2, height/2);
    mass = 20;
    G = 1;
    
    dragOffset = new PVector(0.0,0.0);
  }

  PVector attract (Mover _m) {
    PVector force = PVector.sub(pos, _m.pos);
    float distance = force.mag();
    distance = constrain(distance, 5.0, 25.0);

    force.normalize();
    //A force that is weaker the closer it gets and stronger the farther it gets
    //float strength = (G * mass * _m.mass) / (distance * distance);
    float strength = (G * mass * _m.mass) * (distance * 0.0005);
    force.mult(strength);

    return force;
  }

  void render() {
    noStroke();
    if (dragging) fill (0, 120);
    else if (rollover) fill(0, 100);
    else fill(0, 180);
    
    ellipse(pos.x, pos.y, mass * 2, mass * 2);
  }
  
  //MOUSE INTERACTION METHODS
  
  void clicked(int _mx, int _my) {
    float d = dist(_mx, _my, pos.x, pos.y);
    if (d < mass) {
      dragging = true;
      dragOffset.x = pos.x - _mx;
      dragOffset.y = pos.y - _my;
    }
  }
  
  void hover(int _mx, int _my) {
    float d = dist(_mx, _my, pos.x, pos.y);
    if (d < mass) {
      rollover = true;
    } else {
      rollover = false;
    }
  }
  
  void stopDragging() {
    dragging = false;
  }
  
  void drag() {
    if(dragging) {
      pos.x = mouseX + dragOffset.x;
      pos.y = mouseY + dragOffset.y;
    }
  }
}
