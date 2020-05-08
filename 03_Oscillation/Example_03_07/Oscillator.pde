class Oscillator {
  PVector angle;
  PVector angVel;
  PVector amplitude;
  
  Oscillator() {
    angle = new PVector();
    angVel = new PVector(random(-0.05, 0.05), random(-0.05, 0.05));
    
    amplitude = new PVector(random(width/2), random(height/2));
  }
  
  void oscillate() {
    angle.add(angVel);
  }
  
  void render() {
    float x = amplitude.x * sin(angle.x);
    float y = amplitude.y * sin(angle.y);
    
    pushMatrix();
    translate(width/2, height/2);
    stroke(100);
    fill(100, 200);
    line(0, 0, x, y);
    ellipse(x, y, 20, 20);
    popMatrix();
  }
}
