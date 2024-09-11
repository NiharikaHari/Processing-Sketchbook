Cell grid[][];
Cell next[][];

float Da = 1.0;
float Db = 0.5;
float f = 0.05604; //f= 0.023839595, 0.05604
float k = 0.06199; //k= 0.053589858, 0.06199
float dt = 1.0;


void setup() {
  size(300, 300);
  background(0);
  colorMode(HSB);

  grid = new Cell[width][height];
  next = new Cell[width][height];
  //initial fill grid
  for (int x=0; x<width; ++x) {
    for (int y=0; y<height; ++y) {
      grid[x][y] = new Cell(1, 0, x, y);
      next[x][y] = new Cell(1, 0, x, y);
    }
  }
}


//int kk=0;
void draw() {
  //println(frameRate);
  //println("draw"+kk++);
  for (int x=1; x<width-1; ++x) {
    for (int y=1; y<height-1; ++y) {
      next[x][y] = grid[x][y].calcNext();
    }
  }

  loadPixels();

  //for (int x=1; x<width-1; x+=4) {
  //  for (int y=1; y<height-1; y+=4) {
  //    next[x][y].show();
  //  }
  //}
  for (int x=1; x<width-1; ++x) {
    for (int y=1; y<height-1; ++y) {
      float a = next[x][y].a;
      float b = next[x][y].b;
      color c = color(255*(b), 255*(a), 255*abs(a-b));
      pixels[x+width*y]=c;
    }
  }
  updatePixels();

  Cell[][] temp = grid;
  grid = next;
  next = temp;
}


void mousePressed() {
  for (int x=mouseX-5; x<mouseX+5; ++x) {
    for (int y=mouseY-5; y<mouseY+5; ++y) {
      grid[x][y] = new Cell(0, 1, x, y);
    }
  }
}

void keyPressed() {
  if (key=='q') {
    f = f-0.0001;
    println("f= "+f);
  }
  if (key=='w') {
    f = f+0.0001;
    println("f= "+f);
  }
  if (key=='e') {
    k = k-0.0001;
    println("k= "+k);
  }
  if (key=='r') {
    k = k+0.0001;
    println("k= "+k);
  }
}
