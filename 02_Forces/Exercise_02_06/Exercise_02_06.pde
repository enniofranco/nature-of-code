Mover[] movers = new Mover[3];

Liquid liquid;

void setup() {
  size(600, 600);
  pixelDensity(displayDensity());
  
  liquid = new Liquid(0, height/2, width, height/2, 0.1);
  
  for (int i = 0; i < movers.length; i++) {
    //Make sure to send constant mass
    movers[i] = new Mover(2, random(0.1, width), 0);
  }
}

void draw() {
  background(100);
  
  liquid.render();

  for (int i = 0; i < movers.length; i++) {

    if (movers[i].isInside(liquid)) {
      movers[i].drag(liquid);
    }
    
    //GRAVITY
    //This is Shiffman's hacky way of adding gravity
    //It's a constant * object's mass. The constant in our case is set to 0.1
    float m = 0.1 * movers[i].mass; 
    PVector gravity = new PVector(0, m);
    movers[i].applyForce(gravity);

    movers[i].update();
    movers[i].render();
  }
}
