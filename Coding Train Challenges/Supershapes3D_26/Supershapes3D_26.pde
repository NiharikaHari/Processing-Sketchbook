import peasy.*;

/*

 Draw 3d super shapes in the same way as sphere, only the formula changes
 
 */

PeasyCam cam;

int scale = 150;
int resolution = 200;
PVector globe[][];
float a = 1;
float b = 1;
float angle = 0;

//Constant value controls
/*
1 = m_1
 2 = n1_1
 3 = n2_1
 4 = n3_1
 5 = m_2
 6 = n1_2
 7 = n2_2
 8 = n3_2
 */
char curr = '1';
float m_1 = 1;
float n1_1 = 0.1;
float n2_1 = 0.1;
float n3_1 = 0.1;
float m_2 = 1;
float n1_2 = 0.1;
float n2_2 = 0.1;
float n3_2 = 0.1;

//float sh = 1;

void setup() {
  size(500, 500, P3D);
  colorMode(HSB, 360, 100, 100);

  cam = new PeasyCam(this, 500);
  globe = new PVector[resolution+1][resolution+1];
}

void draw() {
  background(0);
  noStroke();
  //lights();
  ambientLight(255, 0, 50);
  //lightSpecular(204, 204, 204);
  directionalLight(255, 0, 100, 100, 100, 100);
  //specular(255, 255, 255);
  shininess(1.0);
  //float c = map(sin(angle), -1, 1, 1, 10);
  for (int i=0; i<resolution+1; ++i) { //latitude
    float lat = map(i, 0, resolution, -HALF_PI, HALF_PI);

    //float r2 = calcRadius(lat, 7, 0.2, 1.7, 1.7);
    float r2 = calcRadius(lat, m_1, n1_1, n2_1, n3_1);

    for (int j=0; j<resolution+1; ++j) { //longitude
      float lon = map(j, 0, resolution, -PI, PI);

      //float r1 = calcRadius(lon, 7, 0.2, 1.7, 1.7);
      float r1 = calcRadius(lon, m_2, n1_2, n2_2, n3_2);


      float x = scale * r1 * cos(lon) * r2 * cos(lat);
      float y = scale * r1 * sin(lon) * r2 * cos(lat);
      float z = scale * r2 * sin(lat);
      globe[i][j] = new PVector(x, y, z);
    }
  }
  rotateX(angle);
  rotateY(angle*0.2);
  angle+=0.03;

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

float calcRadius(float angle, float m, float n1, float n2, float n3) {
  float p1 = 1/a*cos(m*angle/4.0);
  p1 = abs(p1);
  p1 = pow(p1, n2);

  float p2 = 1/b*sin(m*angle/4.0);
  p2 = abs(p2);
  p2 = pow(p2, n3);

  float r = p1+p2;
  r = pow(r, -1/n1);

  return r;
}

void keyPressed() {
  if (key=='1' || key=='2' || key=='3' || key=='4' || key=='5' || key=='6' || key=='7' || key=='8') {
    curr = key;
  } else if (key=='w') {
    switch(curr) {
    case '1':
      m_1+=0.1;
      break;
    case '2':
      n1_1+=0.1;
      break;
    case '3':
      n2_1+=0.1;
      break;
    case '4':
      n3_1+=0.1;
      break;
    case '5':
      m_2+=0.1;
      break;
    case '6':
      n1_2+=0.1;
      break;
    case '7':
      n2_2+=0.1;
      break;
    case '8':
      n3_2+=0.1;
      break;
    }
  } else if (key=='q') {
    switch(curr) {
    case '1':
      m_1-=0.1;
      break;
    case '2':
      n1_1-=0.1;
      break;
    case '3':
      n2_1-=0.1;
      break;
    case '4':
      n3_1-=0.1;
      break;
    case '5':
      m_2-=0.1;
      break;
    case '6':
      n1_2-=0.1;
      break;
    case '7':
      n2_2-=0.1;
      break;
    case '8':
      n3_2-=0.1;
      break;
    }
  }
  println("1 -> m: "+m_1+" , n1: "+n1_1+" , n2: "+n2_1+" , n3: "+n3_1);
  println("2 -> m: "+m_2+" , n1: "+n1_2+" , n2: "+n2_2+" , n3: "+n3_2);
}
