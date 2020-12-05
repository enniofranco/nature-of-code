class Box {
  
  Body body;
  
  float x, y;
  float w, h;
  
  Box(float _x, float _y) {
    x = _x;
    y = _y;
    w = 16;
    h = 16;
    
    // Step 1: Define body
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(x, y));
    
    // Step 2: Create body
    body = box2d.createBody(bd);
    
    // Step 3: Create shape
    PolygonShape ps = new PolygonShape();
    float box2Dw = box2d.scalarPixelsToWorld(w);
    float box2Dh = box2d.scalarPixelsToWorld(h);
    ps.setAsBox(box2Dw, box2Dh);
    
    // Step 4: Create fixture
    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    // Parameters that affect physics
    fd.density = 1;
    fd.friction = 0.3;
    fd.restitution = 0.5;
    
    // Step 5: Attach shape to body with fixture
    body.createFixture(fd);
    
  }
  
  void update() {
    
  }
  
  void render() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();
    
    pushMatrix();
    translate(pos.x, pos.y);
    //Box2D space is inverted, then invert angle
    rotate(-a);
    fill(100);
    noStroke();
    rectMode(CENTER);
    rect(0,0,w,h);
    popMatrix();
  }
}
