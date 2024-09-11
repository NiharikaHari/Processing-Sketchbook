class Leaf {
  PVector pos;
  boolean reached;

  Leaf(PVector pos) {
    this.pos = pos;
    this.reached = false;
  }

  void show() {
    fill(255);
    noStroke();
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    ellipse(0,0, 4, 4);
    popMatrix();
  }
}
