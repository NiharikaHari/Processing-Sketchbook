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
    ellipse(pos.x, pos.y, 4, 4);
  }
}
