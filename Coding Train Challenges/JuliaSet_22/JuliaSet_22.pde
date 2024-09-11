import g4p_controls.*;

int max_iterations = 100;
float minX= -3.50;
float maxX = 3.50;
float minY= -2.00;
float maxY = 2.00;

float scale = 0.01;

GSlider real_slider;
GSlider imag_slider;
float real_c = -1;
float imag_c = -1;

float add_c = 0.01;



void setup() {
  size(600, 700);
  fullScreen();
  real_slider = new GSlider(this, 10, height-100, 200, 100, 15);
  real_slider.setLimits(-1.000, -1.000, 1.000);
  real_slider.setLocalColorScheme(3);
  imag_slider = new GSlider(this, width-250, height-100, 200, 100, 15);
  imag_slider.setLimits(-1.000, -1.000, 1.000);
  imag_slider.setLocalColorScheme(4);
  colorMode(HSB, 255);
  scale(4);
}

void draw() {
  if (imag_c>=1) {
    add_c = -0.01;
  } else if (imag_c<=-1) {
    add_c = 0.01;
  }
  imag_c += add_c;
  background(100);
  loadPixels();
  for (int y=0; y<height-100; y++) {
    for (int x=0; x<width; x++) {

      float a = map(x, 0, width, minX, maxX);
      float b = map(y, 0, height-100, minY, maxY);

      //double a_og = a;
      //double b_og = b;

      int n=0;

      for (n=0; n<max_iterations; ++n) {
        float real = a*a - b*b;
        float imag = 2*a*b;
        a = real+real_c;
        b = imag+imag_c;
        if (abs(real+imag)>16) {
          break;
        }
      }

      //color c1 = color(0, 255, 255);
      color c2 = color(250, 255, 200);
      //color c1 = color(83, 103, 255);
      //color c1 = color(18, 8, 75);
      //color c2 = color(255, 255, 255);
      float val = map(n, 0, max_iterations, 0, 255);
      color c;
      //if (val<0.1) {
      //val = val;
      //color c3 = color(0, 255, 249 );
      //val = val*10;
      //c = lerpColor(c1, c2, val);
      //} else {
      //val = val*val;
      //c = lerpColor(c1, c, val);
      //}
      //float val = map(n, 0, max_iterations, 0, 255);
      //val = constrain(val*10, 0, 255);
      //color c = color(int(val), 0, 0);
      c = color(val, 255, 255);

      pixels[x+width*y] = c;

      if (n>=max_iterations-1) {
        pixels[x+width*y] = c2;
        if (abs(add_c)<0.01){
          //println("condition");
          add_c = add_c+add_c*0.8;
        }
      }
      if (val>150) {
        if (abs(add_c)>0.001)
          add_c = add_c-add_c*0.1;
      }
      //if (val>230) {
      //  if (abs(add_c)>0.001)
      //    add_c = add_c-add_c*0.9;
      //}
      if(val<150) {
         if (abs(add_c)<0.01)
          add_c = add_c+add_c*0.000001;
      }
      // else {
      //  pixels[x+width*y] = color(255);
      //}
    }
  }

  //if (abs(minX-maxX)<=scale*2 || abs(minY-maxY)<=scale*2) {
  //  scale = scale*0.1;
  //}
  //else {
  //  scale = 0.01;
  //}


  updatePixels();
  //noLoop();
  //if (min<max) {
  //  min=min*0.99;
  //  max=max*0.5;
  //}
  textSize(20);
  fill(255);
  text("scale: "+scale, width*0.5, height-80);
  text("add_c: "+add_c, width*0.1, height-80);
}

public void handleSliderEvents(GValueControl slider, GEvent event) {
  if (slider == real_slider) {
    println(real_slider.getValueS() + "    " + event);
    real_c = Float.parseFloat(real_slider.getValueS());
  } else if (slider == imag_slider) {
    println(imag_slider.getValueS() + "    " + event);
    imag_c = Float.parseFloat(imag_slider.getValueS());
  }
}

public void keyPressed() {
  if (keyCode==RIGHT) {
    minX+=scale;
    maxX+=scale;
  } else if (keyCode == LEFT) {
    minX-=scale;
    maxX-=scale;
  } else if (keyCode == DOWN) {
    minY+=scale;
    maxY+=scale;
  } else if (keyCode == UP) {
    minY-=scale;
    maxY-=scale;
  } else if (key=='q') {
    minX+=scale;
    minY+=scale;
    maxX-=scale;
    maxY-=scale;
    println("minX: "+minX+" , maxX: "+maxX+" , minY: "+minY+"maxY: "+maxY);
  } else if (key=='w') {
    minX-=scale;
    minY-=scale;
    maxX+=scale;
    maxY+=scale;
    println("minX: "+minX+" , maxX: "+maxX+" , minY: "+minY+" , maxY: "+maxY);
  } else if (key=='r') {
    scale = scale*10;
  } else if (key=='e') {
    scale = scale*0.1;
  } else if (key==' ') {
    if (add_c!=0)
      add_c = 0;
    else
      add_c = 0.01;
  }
}
