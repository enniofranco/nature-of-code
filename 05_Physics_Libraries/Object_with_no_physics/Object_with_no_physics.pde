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

ArrayList<Box> boxes;
int boxesArraySize;

void setup() {
  size(600, 600);
  boxesArraySize = 10;
  boxes = new ArrayList<Box>();
  for (int i = 0; i < boxesArraySize; i++) {
    PVector v = new PVector(random(width), random(height));
    boxes.add(new Box(v, random(16, 32)));
  }
}

void draw() {
  background(200);
  for (int i = 0; i < boxesArraySize; i++) {
    Box b = boxes.get(i);
    b.update();
    b.render();
  }
}
