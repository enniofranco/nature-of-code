Vehicle v;

void setup() {
  size(600, 600);
  v = new Vehicle(random(width), random(height));
}

void draw() {
  background(255);
  
  PVector mouse = new PVector(mouseX, mouseY);
  
  fill(200);
  //stroke(0);
  //strokeWeight(2);
  noStroke();
  ellipse(mouse.x, mouse.y, 48, 48);
  
  //v.seek(mouse);
  v.arrive(mouse);
  v.update();
  v.display();
}
