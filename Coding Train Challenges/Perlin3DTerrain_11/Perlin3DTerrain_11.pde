import peasy.*;

int w = 1200;
int h = 1200;
int scale = 20;
int rows, cols;
float terrain[][];
float flying = 0;
float smoothness = 0.06;
float maxHeight = 100;
float bop = 0;
float bopCtrl;

//PeasyCam cam;


void setup() {
  size(600, 600, P3D);
  rows = w/scale;
  cols = h/scale;
  terrain = new float[rows][cols];
  //cam = new PeasyCam(this,500);
}

void draw() {

  if (keyPressed) {
    if (keyCode == UP) {
      bop+=5;
    } else if (keyCode==DOWN) {
      bop-=5;
    }
  }
  //smoothness = map(mouseX,0,width,0,0.08);
  //lights();
  directionalLight(255, 255, 255, 500, 800, 500);
  float yOff = 0;
  for (int y=0; y<cols; ++y) {
    yOff+=smoothness;
    flying-=0.0008;
    float xOff = 0;
    for (int x=0; x<rows; ++x) {
      xOff+=smoothness;
      terrain[x][y]=map(noise(xOff, yOff+flying), 0, 1, -maxHeight, maxHeight);
    }
  }

  //println(bop);
  background(0);
  translate(width/2, height/2+bop);
  rotateX(PI*0.4);
  translate(-w/2, -h/2);

  stroke(255);
  noFill();
  //noStroke();
  //fill(191, 161, 238);
  for (int y=0; y<cols-1; ++y) {
    beginShape(TRIANGLE_STRIP);
    for (int x=0; x<rows; ++x) {
      vertex(x*scale, y*scale, terrain[x][y]);
      vertex(x*scale, (y+1)*scale, terrain[x][y+1]);
      //rect(x*scale,y*scale,scale,scale);
    }
    endShape();
  }
}
