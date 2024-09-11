float xOff = 0;
float yOff = 0;
float zOff = 0;

float inc = 0.05;

int rows, cols;
int scl = 10;

Particle particles[];
int numOfParticles = 10000;

PVector vectors[];

void setup() {
  size(1200, 900);
  background(255);
  rows = height/scl;
  cols = width/scl;
  particles = new Particle[numOfParticles];
  for (int i=0; i<numOfParticles; ++i) {
    particles[i] = new Particle();
  }
  vectors = new PVector[rows*cols];
}

void draw() {

  //background(255);

  yOff=0;
  for (int y=0; y<rows; ++y) {
    xOff=0;
    for (int x=0; x<cols; ++x) {
      int index = x + cols * y;
      //pixels[index]=color(floor(noise(xOff, yOff)*255));
      //fill(color(floor(noise(xOff, yOff)*255)));
      //rect(x*scl, y*scl, scl, scl);

      PVector v = PVector.fromAngle(noise(xOff, yOff, zOff)*4*TWO_PI);
      v.normalize();
      //v.setMag(1);
      vectors[index] = v;


      //pushMatrix();
      //translate(x*cols, y*cols);
      //rotate(v.heading());
      //stroke(0, 150);
      //line(0, 0, v.x, v.y);
      //popMatrix();

      xOff+=inc;
    }
    yOff+=inc;
  }
  zOff+=inc*0.05;


  for (int i=0; i<numOfParticles; ++i) {
    particles[i].move();
    particles[i].edges();
    particles[i].update();
    particles[i].show();
  }
}

//void mousePressed(){
//  inc = map(mouseX,0,width,0,1);
//}
