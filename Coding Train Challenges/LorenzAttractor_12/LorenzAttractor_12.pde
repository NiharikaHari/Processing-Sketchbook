import processing.sound.*;
import peasy.*;

Amplitude amp;
SoundFile song;
PeasyCam cam;
PImage bg;

Path[] p;
color[] colors;

float a = 10;
float b = 28;
float c = 8/3.0;
float dt = 0.01;

float angle;

void setup() {
  size(900, 900, P3D);
  cam = new PeasyCam(this, 500);
  p = new Path[6];
  colors = new color[4];
  colors[0] = color(139, 64, 255);
  colors[1] = color(255, 64, 85);
  colors[2] = color(180, 255, 64);
  colors[3] = color(64, 255, 235);

  for (int i=0; i<p.length; ++i) {
    p[i] = new Path(new PVector((i+1)*0.1, 0, i*0.1), colors[int(random(colors.length))], i%2);
  }
  amp = new Amplitude(this);
  song = new SoundFile(this, "song.mp3");
  bg = loadImage("purple_midnight.jpg");
  bg.resize(width, height);
  //song.play();
  amp.input(song);
  angle = 0.01;
  frameRate(20);
  noLoop();
}

void draw() {
  println(frameRate);

  float am = amp.analyze();
  background(40*am);
  //translate(-width/2,-height/2);

  //image(bg,0,0);
  //translate(width/2,height/2);

  scale(3);
  //tint(0,0,0);

  rotateX(angle);
  rotateY(angle);
  rotateZ(angle);
  angle +=0.01;
  for (int i=0; i<p.length; ++i) {
    p[i].getNextVertex();
  }

  if (am>0.8) {
    //println(am);
    for (int i=0; i<p.length; ++i) {
      p[i].showSquiggle(am);
    }
  } else {
    for (int i=0; i<p.length; ++i) {
      p[i].show();
    }
  }
}

void mousePressed() {
  loop();
  song.play();
}
