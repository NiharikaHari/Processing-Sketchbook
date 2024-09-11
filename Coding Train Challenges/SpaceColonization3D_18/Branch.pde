class Branch {
  Branch parent;
  PVector pos;
  PVector dir;
  int count;
  PVector ogDir;
  float thickness;
  int index;
  int min_width;
  int max_width;

  Branch(Branch parent, PVector pos, PVector dir) {
    this.parent = parent;
    this.pos = pos;
    this.dir = dir;
    this.count = 0;
    this.ogDir = dir.copy();
    this.thickness = abs(map(tree.branches.size(),0,1000,max_width,min_width));
    this.index = tree.branches.size();
    this.min_width = 1;
    this.max_width = 5;
  }

  void reset() {
    this.dir = ogDir.copy();
    this.count = 0;
    //this.branchedFrom = 0;
  }

  void show() {
    
    if (parent!=null) {
      //thickness depends on distance from root
      float d = PVector.dist(this.pos, tree.branches.get(0).pos);
      thickness = constrain(map(d, 0, width-100, max_width,min_width), min_width,max_width);
      //stroke(map(thickness,min_width,max_width,245,10)+random(-10,10),150);
      stroke(255);
      //thickness = map(index,0,tree.branches.size(),max_width,min_width);

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
