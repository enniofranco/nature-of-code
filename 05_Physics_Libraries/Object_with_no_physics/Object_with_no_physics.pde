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

ArrayList<Object> objects;
int objectsArraySize;

void setup() {
  size(600, 600);
  objectsArraySize = 10;
  objects = new ArrayList<Object>();
  for (int i = 0; i < objectsArraySize; i++) {
    PVector v = new PVector(random(width), random(height));
    objects.add(new Object(v, random(16, 32)));
  }
}

void draw() {
  background(200);
  for (int i = 0; i < objectsArraySize; i++) {
    Object o = objects.get(i);
    o.update();
    o.render();
  }
}
