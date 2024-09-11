import g4p_controls.*;

float n = 2;
int a = 100;
int b = 100;

GSlider sdr;


void setup() {
  background(0);
  size(500, 500);
  sdr = new GSlider(this, width/2-100, height-100, 200, 100, 15);
  sdr.setLimits(2,0.1,10);
  sdr.setLocalColorScheme(3);
  //sdr.setOpaque(false);
  //sdr.setValue(0.5);
  //sdr.setNbrTicks(2);
  //sdr.setShowLimits(false);
  //sdr.setShowValue(false);
  //sdr.setShowTicks(false);
  //sdr.setStickToTicks(false);
  //sdr.setEasing(1.0);
  //sdr.setRotation(0.0, GControlMode.CENTER);
}

void draw() {
  //noLoop();
  background(0);
  //translate(width/2, height/2);
  stroke(255);
  fill(n*25, n*25, random(255));
  //noFill();
  beginShape();
  for (float theta = 0; theta < 2*PI; theta += 0.1) {
    float x = pow(abs(cos(theta)), 2.0/n) * a * sgn(cos(theta));
    float y = pow(abs(sin(theta)), 2.0/n) * b * sgn(sin(theta));
    vertex(x+width/2, y+height/2);
    //println("theta: "+theta+" , x: "+x+" , y: "+y);
  }
  endShape(CLOSE);
  //println("OVER");
}

public void handleSliderEvents(GValueControl slider, GEvent event) {
  if (slider == sdr){  // The slider being configured?
    println(sdr.getValueS() + "    " + event);
    n = Float.parseFloat(sdr.getValueS());
  }
}

void keyPressed() {
  if (Character.isDigit(key)) {
    n = key - '0';
    println("n: "+n);
  }
}

int sgn(float num) {
  if (num>0)
    return 1;
  else if (num<0)
    return -1;
  else
    return 0;
}
