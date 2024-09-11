class Branch {
  Branch parent;
  PVector pos;
  PVector dir;
  int count;
  PVector ogDir;
  float thickness;
  int index;
  int minWidth;
  int maxWidth;

  Branch(Branch parent, PVector pos, PVector dir) {
    this.parent = parent;
    this.pos = pos;
    this.dir = dir;
    this.count = 0;
    this.ogDir = dir.copy();
    this.thickness = abs(map(tree.branches.size(), 0, 1000, maxWidth, minWidth));
    this.index = tree.branches.size();
    this.minWidth = 1;
    this.maxWidth = 20;
  }

  void reset() {
    this.dir = ogDir.copy();
    this.count = 0;
    //this.branchedFrom = 0;
  }

  void show() {
    stroke(255);
    if (parent!=null) {
      //thickness depends on distance from root
      float d = PVector.dist(this.pos, tree.branches.get(0).pos);
      thickness = constrain(map(d, 0, width, maxWidth, minWidth), minWidth, maxWidth);

      //thickness = map(index,0,tree.branches.size(),70,1);

      //thickness depends on num of branches in system
      //added in constructor

      strokeWeight(thickness);
      line(parent.pos.x, parent.pos.y, pos.x, pos.y);
    }
  }

  Branch generateNext() {
    PVector newPos = PVector.add(pos, dir);
    Branch next = new Branch(this, newPos, dir.copy());
    return next;
  }
}
