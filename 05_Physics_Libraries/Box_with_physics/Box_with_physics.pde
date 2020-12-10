import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;

ArrayList<Box> boxes;

void setup() {
  size(600, 600);
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  
  boxes = new ArrayList<Box>();
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
  
}
