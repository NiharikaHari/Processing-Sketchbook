int scale;
int rows;
int cols;
Cell[] grid;
Cell current;
ArrayList<Cell> stack;

//int index;

void setup() {
  //frameRate(2);

  //index = 0;

  size(400, 400);
  scale = 15;
  rows = height/scale;
  cols = width/scale;
  grid = new Cell[rows*cols];
  int index=0;
  for (int i=0; i<rows; ++i) {
    for (int j=0; j<cols; ++j) {
      grid[index++]=new Cell(i, j, scale);
    }
  }
  for (int i=0; i<grid.length; ++i) {
    grid[i].calcNeighbours();
  }
  current = grid[0];

  stack = new ArrayList<Cell>();
  stack.add(current);



  noLoop();
}

void draw() {
  background(0);
  for (Cell c : grid) {
    c.show();
    current.highlight();
  }


  current.visited = true;


  //if (current.i>0)
  //println("i: "+current.i);
  //println("j: "+current.j);
  //grid[current.j-1+current.i*cols].visited = true;
  //current = grid[index++];
  Cell next = current.getNextNeighbour();

  //println(index);
  if (next!=null) {
    //Cell next = current.neighbours.get(index);
    //stack.add(next);
    current.removeWalls(current, next);
    current = next;
    stack.add(current);
    current.visited = true;
  } else {
    if (stack.size()>0)
      current = popLast();
    else
      noLoop();
  }
}

void mousePressed() {
  loop();
}

Cell popLast() {
  int lastIndex = stack.size()-1;
  Cell result = stack.get(lastIndex);
  stack.remove(lastIndex);
  //result.popped = true;
  return result;
}
