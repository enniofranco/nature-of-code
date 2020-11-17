class Stripe {
  float angle;
  float velocity;
  PVector amplitude;
  
  Stripe() {
    angle = 0;
    velocity = random(-0.05,0.05);
    amplitude = new PVector(random(width/2),0);
  }
  
  void update() {
    angle += velocity;
  }
  
  void render() {
    float x = sin(angle) * amplitude.x;
    float y = cos(angle) * amplitude.y;
    float x1 = sin(angle+PI) * amplitude.x;
    float y1 = cos(angle+PI) * amplitude.y;
    
    float x2 = sin(angle) * amplitude.x/2;
    float y2 = cos(angle) * amplitude.y;
    float x3 = sin(angle+PI) * amplitude.x/2;
    float y3 = cos(angle+PI) * amplitude.y;
    
    pushMatrix();
    translate(width/2, height/2);
    noStroke();
    fill(100);
    ellipse(x, y, 16, 16);
    ellipse(x1, y1, 16, 16);
    ellipse(x2, y2, 16, 16);
    ellipse(x3, y3, 16, 16);
    popMatrix();
  }
    
  
}
