//To be very honest, I'm not sure if this exercise is correct

Walker solange;

void setup() {
  pixelDensity(displayDensity());
  size(600, 600);
  solange = new Walker();
  
}

void draw() {
  solange.step();
  solange.render();
}
