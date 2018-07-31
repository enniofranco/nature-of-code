Mover[] movers = new Mover[5];

void setup() {
  size(800,800);
  for(int i=0; i < movers.length; i++) {
    movers[i] = new Mover(random(0.1,5),random(0,width),height/2);
  }
}

void draw() {
  
  background(200);
  
  for(int i=0; i < movers.length; i++) {
    
    PVector wind = new PVector(0.001, 0);
    PVector gravity = new PVector(0,0.1*movers[i].mass);
    //friction
    float c = 0.01;
    PVector friction = movers[i].velocity.get();
    friction.mult(-1);
    friction.normalize();
    friction.mult(c);
    
    movers[i].applyForce(friction);
    movers[i].applyForce(wind);
    movers[i].applyForce(gravity);
    movers[i].update();
    movers[i].display();
    movers[i].edges();
    
  }
  
}
