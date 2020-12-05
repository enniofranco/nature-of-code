//1 - Create a body definition
//1a Initial position
//1b Type (Dynamic / Static / Kinematic)
//
//2 - Create the body
//
//3 - Create a shape
//
//4 - Create a fixture (the glue that attaches the shape to the body)
//4a - Define other physics parameters(density / friction / restitution)
//
//5 - Put it all together

//---

//1 - Deal with Box2D world
//In the "main" tab in setup()

//2 - Create body (as per above)
//In our object Box constructor

//3 - Ask Box2D "where is the body?"
//in the "Box" render()

import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

ArrayList<Box> boxes;
int boxesArraySize;

Box2DProcessing box2d;

void setup() {
  size(600, 600, FX2D);
  
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  
  boxesArraySize = 300;
  boxes = new ArrayList<Box>();
  for (int i = 0; i < boxesArraySize; i++) {
    float x = random(270, width-270);
    float y = random(270, height-270);
    boxes.add(new Box(x, y));
  }
}

void draw() {
  background(4, 28, 224);
  
  strokeWeight(2);
  stroke(0, 180);
  line(width/2, 50, width/2, height-50);
  
  box2d.step();
  for (int i = 0; i < boxesArraySize; i++) {
    Box b = boxes.get(i);
    b.update();
    b.render();
  }
  
}
