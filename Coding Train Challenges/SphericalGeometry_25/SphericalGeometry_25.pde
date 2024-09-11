import peasy.*;

/*

 Draw the 2d sphere shape using triangle strips
 
 We need latitudes going from 0 to 180 degrees
 And longitudes from 0 to 360 degrees
 for each we calculate x,y,z using formulas
 
 Draw triangle strips for these
 
 
 */

PeasyCam cam;
int radius = 100;
int resolution = 200;
PVector globe[][];

void setup() {
  size(500, 500, P3D);
  cam = new PeasyCam(this, 500);
  globe = new PVector[resolution+1][resolution+1];
}

void draw() {
  background(0);
  noStroke();
  lights();
  //pointLight(250,0,100,300,300,300);
  //ambientLight(250,0,10);
  colorMode(HSB, 360, 100, 100);
  //fill(100);
  //sphere(100);
  for (int i=0; i<resolution+1; ++i) { //latitude
    float lat = map(i, 0, resolution, 0, PI);
    for (int j=0; j<resolution+1; ++j) { //longitude
      float lon = map(j, 0, resolution, 0, TWO_PI);
      float x = radius * sin(lat) * cos(lon);
      float y = radius * sin(lat) * sin(lon);
      float z = radius * cos(lat);
      globe[i][j] = new PVector(x, y, z);
      //point(v.x, v.y, v.z);
    }
  }

  for (int i=0; i<resolution; ++i) { //latitude
    beginShape(TRIANGLE_STRIP);
    fill(map(i, 0, resolution, 0, 360), 100, 100);
    for (int j=0; j<resolution+1; ++j) { //longitude
      PVector v1 = globe[i][j];
      vertex(v1.x, v1.y, v1.z);
      PVector v2 = globe[i+1][j];
      vertex(v2.x, v2.y, v2.z);
    }
    endShape();
  }
}
