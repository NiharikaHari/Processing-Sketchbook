class Branch {
  Branch parent;
  PVector pos;
  PVector dir;
  int count;
  PVector ogDir;

  Branch(Branch parent, PVector pos, PVector dir) {
    this.parent = parent;
    this.pos = pos;
    this.dir = dir;
    this.count = 0;
    this.ogDir = dir.copy();
  }

  void reset() {
    this.dir = ogDir.copy();
    this.count = 0;
    //this.branchedFrom = 0;
  }

  void show() {
    //stroke(255);
    //color c = color(int(random(255)), int(random(255)), int(random(255)));
    color c = color(int(random(100,255)), 100,100);
    stroke(c);
    //noStroke();
    if (parent!=null) {
      line(parent.pos.x, parent.pos.y, parent.pos.z, pos.x, pos.y, pos.z);
      //beginShape(LINES);
      //texture(img);
      //vertex(parent.pos.x, parent.pos.y, parent.pos.z,0,0);
      //vertex(pos.x, pos.y, pos.z,1,1);
      //endShape();
    }
  }

  Branch generateNext() {
    PVector newPos = PVector.add(pos, dir);
    Branch next = new Branch(this, newPos, dir.copy());
    return next;
  }
}
