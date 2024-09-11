import g4p_controls.*;

int max_iterations = 100;
float minX= -2.00;
float maxX = 2.00;
float minY= -2.00;
float maxY = 2.00;

float scale = 0.01;

//GSlider min_slider;
//GSlider max_slider;


void setup() {
  size(900, 1000);
  //fullScreen();
  //min_slider = new GSlider(this, 10, height-100, 200, 100, 15);
  //min_slider.setLimits(-2.00, -2.00, 0.00);
  //min_slider.setLocalColorScheme(3);
  //max_slider = new GSlider(this, width-250, height-100, 200, 100, 15);
  //max_slider.setLimits(0.00, 0.00, 2.00);
  //max_slider.setLocalColorScheme(4);
}

void draw() {
  background(100);
  loadPixels();
  for (int y=0; y<height-100; y++) {
    for (int x=0; x<width; x++) {

      double a = map(x, 0, width, minX, maxX);
      double b = map(y, 0, height-100, minY, maxY);

      double a_og = a;
      double b_og = b;

      int n=0;

      for (n=0; n<max_iterations; ++n) {
        double real = a*a - b*b;
        double imag = 2*a*b;
        a = real+a_og;
        b = imag+b_og;
        if (Math.abs(real+imag)>16) {
          break;
        }
      }

      color c1 = color(83, 103, 255);
      color c2 = color(255, 0, 0);
      float val = map(n, 0, max_iterations, 0, 1);
      color c;
      if (val<0.1) {
        color c3 = color(0, 255, 249 );
        val = val*10;
        c = lerpColor(c1, c3, val);
      } else {
        val = val*val;
        c = lerpColor(c1, c2, val);
      }
      //float val = map(n, 0, max_iterations, 0, 255);
      //val = constrain(val*10, 0, 255);
      //color c = color(int(val), 0, 0);

      pixels[x+width*y] = c;

      if (n>=max_iterations-1) {
        pixels[x+width*y] = color(0);
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
  text("scale: "+scale, width/2-100, height-50);
}

//public void handleSliderEvents(GValueControl slider, GEvent event) {
//  if (slider == min_slider) {
//    println(min_slider.getValueS() + "    " + event);
//    minX = Float.parseFloat(min_slider.getValueS());
//    minY = Float.parseFloat(min_slider.getValueS());
//  } else if (slider == max_slider) {
//    println(max_slider.getValueS() + "    " + event);
//    maxX = Float.parseFloat(max_slider.getValueS());
//    maxY = Float.parseFloat(max_slider.getValueS());
//  }
//}

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
  }
}
