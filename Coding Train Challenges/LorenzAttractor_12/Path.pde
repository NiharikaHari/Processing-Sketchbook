class Path {
  PVector current;
  ArrayList<PVector> vertices;
  ArrayList<PVector> verticesBackup;
  color col;
  int dir;

  Path(PVector current, color col, int dir) {
    this.current = current;
    this.col = col;
    this.vertices = new ArrayList<PVector>();
    this.verticesBackup = new ArrayList<PVector>();
    this.dir = dir;
    if (dir==0)
      this.dir = -1;
  }

  PVector getNextVertex() {
    vertices.add(current.copy());
    float dx = (a*(current.y-current.x))*dt;
    float dy = (current.x*(b-current.z)-current.y)*dt;
    float dz = (current.x*current.y - c*current.z)*dt;
    current.add(new PVector(dx, dy, dz));
    return current;
  }

  void show() {
    noStroke();
    fill(col);

    //if (dir==0) {
    translate(dir*current.x, dir*current.y, dir*current.z);
    sphere(1);
    translate(-dir*current.x, -dir*current.y, -dir*current.z);
    //} else {
    //  translate(-current.x, -current.y, -current.z);
    //  sphere(1);
    //  translate(current.x, current.y, current.z);
    //}

    noFill();
    stroke(col, 150);
    beginShape();
    for (PVector v : vertices) {
      //stroke(col);
      //if (dir==0)
      curveVertex(dir*v.x, dir*v.y, dir* v.z);
      //else
      //curveVertex(-v.x, -v.y, -v.z);
    }
    endShape();
  }

  void showSquiggle(float am) {
    noStroke();
    fill(col);
    //if (dir==0) {
    translate(dir*current.x, dir*current.y, dir*current.z);
    sphere(1);
    translate(-dir*current.x, -dir*current.y, -dir*current.z);
    //} else {
    //  translate(-current.x, -current.y, -current.z);
    //  sphere(1);
    //  translate(current.x, current.y, current.z);
    //}

    noFill();
    stroke(col, 150);
    beginShape();
    for (PVector v : vertices) {
      float xOff = random(-am, am);
      //stroke(col);
      //if (dir==0)
      curveVertex(dir*(v.x+xOff), dir*v.y, dir*v.z);
      //else
      //curveVertex(-(v.x+xOff), -v.y, -v.z);
    }
    endShape();
  }
}
