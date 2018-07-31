Mover[] movers = new Mover[1];

void setup() {
  size(800,800);
  for(int i=0; i < movers.length; i++) {
    movers[i] = new Mover(random(0.1,5),width/2,height/2);
  }
}

void draw() {
  
  background(200);
  PVector invisible = new PVector(0,0);
  PVector wind = new PVector(0.1, 0);
  PVector gravity = new PVector(0,0.1);
  
  for(int i=0; i < movers.length; i++) {
    
    if(movers[i].location.x > 600) {
      float invX = map(movers[i].location.x,600,800,-0.1,-0.3);
      invisible.set(invX,0);
      movers[i].applyForce(invisible);
    } else if (movers[i].location.x < 200) {
      float invX = map(movers[i].location.x,0,200,0.1,0.3);
      invisible.set(invX,0);
      movers[i].applyForce(invisible);
    }
    
    if(keyPressed) {
      movers[i].applyForce(wind);
    }
    
    movers[i].applyForce(gravity);
    movers[i].update();
    movers[i].display();
    movers[i].edges();
    
  }
  
}
