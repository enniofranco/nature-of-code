class Node {
  PVector pos;
  PVector fieldOfAction1, fieldOfAction2;
  float nodeSize;

  Node(PVector _pos, float _fieldOfAction, float _nodeSize) {
    _fieldOfAction = _fieldOfAction / 2;
    pos = _pos.copy();
    fieldOfAction1 = new PVector(pos.x-_fieldOfAction, pos.y-_fieldOfAction);
    fieldOfAction2 = new PVector(pos.x+_fieldOfAction, pos.y+_fieldOfAction);
    nodeSize = _nodeSize;
  }

  void update(float _noiseX, float _noiseY) {
    pos.x = map(_noiseX, 0, 1, fieldOfAction1.x, fieldOfAction2.x);
    pos.y = map(_noiseY, 0, 1, fieldOfAction1.y, fieldOfAction2.y);
  }

  void render() {
    noStroke();
    rectMode(CENTER);
    //rect(pos.x, pos.y, nodeSize, nodeSize);
    ellipse(pos.x, pos.y, nodeSize, nodeSize);
  }
}
