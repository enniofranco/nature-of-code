/*A bit dirty but it worked*/

Leg[] legs;

void setup() {
  size(600, 600);
  legs = new Leg[80];
  for(int i = 0; i < legs.length; i++) {
    legs[i] = new Leg(i*10 - 50, height/2, i*0.2);
  }
}

void draw() {
  background(200);
  for(int i = 0; i < legs.length; i++) {
    legs[i].update();
    legs[i].render();
  }
}
