class Walker {
  PVector pos;
  
  Walker() {
    pos = new PVector(width/2, height/2);
  }
  
  void step() {
    //Choose a random number
    float r = random(1);
    //Use random number to determine direction
    //For it to go right and down
    if (r < 0.5) {
      if(mouseX > pos.x) {
        pos.x++;
      } else {
        pos.x--;
      }
      if(mouseY > pos.y) {
        pos.y++;
      } else {
        pos.y--;
      }
    } else if (r < 0.625) {
      pos.x++;
    } else if (r < 0.75) {
      pos.x--;
    } else if (r < 0.875) {
      pos.y++;
    } else {
      pos.y--;
    }
  }
  
  void render() {
    noStroke();
    fill(255, 40);
    ellipse(pos.x, pos.y, 8, 8);
  }
  
}
