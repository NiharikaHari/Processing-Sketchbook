import processing.sound.*;

Amplitude amp;
PitchDetector pitch;
float amps[];
//float pis[];
SoundFile song;

float n1=13; //0.1    1.4    -17.6    -0.6 to 0.6
float n2=5.8; //1.7    4      -0.9     5.8/8.1/7.8
float n3=5; //1.7    -2.7   -0.5     0.8/1.0/0.6
float m=3;
float a=3;
float b=1;

float resolution = 5000.0;
float radius = 150;

float osc=0;
float osc1=0;

float col=0;
float pi=0;
float max_pi=100;
float min_pi=500;
//float c1 = color();
//float c2 = color();

void setup() {
  size(600, 600);
  amp = new Amplitude(this);
  pitch = new PitchDetector(this, 0.6);
  song = new SoundFile(this, "song.mp3");
  amp.input(song);
  pitch.input(song);
  amps = new float[5];
  //pis = new float[30];
  colorMode(HSB, 360, 100, 100);
  //noLoop();
}

void draw() {
  background(0);
  //stroke(255, 0, random(255));
  noFill();
  float r, x, y;

  float am = amp.analyze();
  pi = pitch.analyze();
  if (pi>0) {
    //for (int i=0; i<pis.length-1; ++i) {
    //  amps[i]=amps[i+1];
    //}
    //amps[amps.length-1]=am;
    //println(pi);
    col = map(pi, 100, 510, 0, 360);
    if (pi>max_pi)
      max_pi = pi;
    if (pi<min_pi)
      min_pi = pi;
  }

  stroke(col, 72, 59);
  strokeWeight(2);


  for (int i=0; i<amps.length-1; ++i) {
    amps[i]=amps[i+1];
  }
  amps[amps.length-1]=am;

  float sum_am = 0.0;
  for (int i=0; i<amps.length; ++i) {
    sum_am+=amps[i];
  }
  float avg_am = sum_am/amps.length;

  //float sum_pi = 0.0;
  //for (int i=0; i<pis.length; ++i) {
  //  sum_pi+=pis[i];
  //}
  //float avg_pi = sum_pi/pis.length;

  m = (map(sin(osc), -1, 1, 0, 3*TWO_PI));
  //n1 = map(sin(osc1), -1, 1, -0.6, 0.6);
  //n1 = map(avg_am, 0, 1, 0.1, 0.6);
  n2 = map(avg_am, 0, 1, -15, -4);
  osc+=0.0002*(avg_am*5);
  osc1+=0.01;

  translate(height/2, width/2);
  float inc = 6*TWO_PI/resolution;
  //println(inc);
  beginShape();
  for (float angle=0; angle<6*TWO_PI; angle+=inc) {
    //println("angle: "+angle);
    r = superShape(angle);
    //println("r: "+r);
    x = radius * r * cos(angle);
    y = radius * r * sin(angle);
    vertex(x, y);
    //println("x: "+x+" , y: "+y);
  }
  endShape();
}

float superShape(float theta) {
  float r;

  float p1 = 1/a * cos(theta*m/4);
  p1 = abs(p1);
  p1 = pow(p1, n2);
  //println("p1: "+p1);

  float p2 = 1/b * sin(theta*m/4);
  p2 = abs(p2);
  p2 = pow(p2, n3);
  //println("p2: "+p2);


  float p3 = pow(p1+p2, 1/n1);
  //println("p3: "+p3);

  r = 1/p3;

  return r;
}

void keyPressed() {
  if (key=='q') {
    n1+=0.1;
  } else if (key=='w') {
    n1-=0.1;
  } else  if (key=='a') {
    n2+=0.1;
  } else if (key=='s') {
    n2-=0.1;
  } else  if (key=='z') {
    n3+=0.1;
  } else if (key=='x') {
    n3-=0.1;
  }
  println("n1: "+n1+" , n2: "+n2+" , n3: "+n3);
  //println("pi: "+pi+" , max_pi: "+max_pi+" ,  min_pi: "+min_pi);
}

void mousePressed() {
  loop();
  song.play();
}

//void mousePressed(){
//  m = floor(map(mouseX,0,width,0,10));
//  //println(m);
//}
