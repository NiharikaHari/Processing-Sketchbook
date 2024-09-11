class Cell {
  int i;
  int j;
  int scale;
  boolean[] walls;
  boolean visited;
  ArrayList<Cell> neighbours;
  //boolean popped;

  Cell(int i, int j, int scale) {
    this.i = i;
    this.j = j;
    this.scale = scale;
    this.walls=new boolean[]{true, true, true, true};
    //this.popped=false;
    neighbours = new ArrayList<Cell>();
  }

  void calcNeighbours() {

    if (j>0)
      neighbours.add(grid[j-1+i*cols]);
    if (j<cols-1)
      neighbours.add(grid[j+1+i*cols]);
    if (i>0)
      neighbours.add(grid[j+(i-1)*cols]);
    if (i<rows-1)
      neighbours.add(grid[j+(i+1)*cols]);

    //println(neighbours);
  }

  Cell getNextNeighbour() {

    boolean isValid = false;
    ArrayList<Cell> temp = new ArrayList<Cell>();
    for (int k = 0; k<neighbours.size(); ++k) {
      if (!neighbours.get(k).visited) {
        isValid = true;
        temp.add(neighbours.get(k));
      }
    }
    //println(neighbours.size());
    if (isValid) {
      int index = int(random(temp.size()));
      return temp.get(index);
    }
    return null;
  }

  void show() {

    if (visited) {
      noStroke();
      fill(36, 168, 252, 200);
      rect(i*scale, j*scale, scale, scale);
    }

    stroke(255);
    strokeWeight(1.2);
    noFill();
    //rect(i*scale, j*scale, scale, scale);

    //draw walls
    if (walls[3])
      line(i*scale, j*scale, i*scale+scale, j*scale);
    if (walls[0])
      line(i*scale, j*scale, i*scale, j*scale+scale);
    if (walls[2])
      line(i*scale+scale, j*scale, i*scale+scale, j*scale+scale);
    if (walls[1])
      line(i*scale, j*scale+scale, i*scale+scale, j*scale+scale);



    // if (popped) {
    //  noStroke();
    //  fill(120, 36, 252, 200);
    //  rect(i*scale, j*scale, scale, scale);
    //}
  }


  void highlight() {
    stroke(0);
    fill(252, 36, 60, 100);
    //rect(i*scale, j*scale, scale, scale);
    ellipseMode(CORNER);
    ellipse(i*scale, j*scale, scale, scale);
  }

  void removeWalls(Cell a, Cell b) {
    int diff1 = a.i - b.i;
    if (diff1==-1) {
      a.walls[2]=false;
      b.walls[0]=false;
    } else if (diff1==1) {
      a.walls[0]=false;
      b.walls[2]=false;
    }
    int diff2 = a.j - b.j;
    if (diff2==-1) {
      a.walls[1]=false;
      b.walls[3]=false;
    } else if (diff2==1) {
      a.walls[3]=false;
      b.walls[1]=false;
    }
  }
}
