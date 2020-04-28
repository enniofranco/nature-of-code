PVector mouse;
PVector centre;

void setup() {
  pixelDensity(displayDensity());
  size(600, 600);
  centre = new PVector(width/2, height/2);
}

void draw() {
  background(100);
  mouse = new PVector(mouseX, mouseY);
  mouse.sub(centre);
  mouse.mult(0.5);
  translate(width/2, height/2);
  stroke(200,100);
  line(0, 0, mouse.x, mouse.y);
  rectMode(CENTER);
  fill(200);
  ellipse(mouse.x, mouse.y, 10, 10);
}
