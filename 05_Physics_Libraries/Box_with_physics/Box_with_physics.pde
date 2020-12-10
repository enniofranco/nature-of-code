import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;

ArrayList<Box> boxes;
Boundary bound1;
Surface surface;

void setup() {
  size(600, 600, FX2D);
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  
  boxes = new ArrayList<Box>();
  bound1 = new Boundary(width/2, height/2, 200, 10);
  surface = new Surface();
}

void draw() {
  background(200);
  
  box2d.step();
  
  if(mousePressed) {
    Box p = new Box();
    boxes.add(p);
  }
  
  for(Box b : boxes) {
    b.display();
  }
  
  bound1.display();
  surface.display();
}
