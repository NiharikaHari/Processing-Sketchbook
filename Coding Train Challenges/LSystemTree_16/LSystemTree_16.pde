/*
 Variables: F + - [ ]
 Axiom: F
 Rules: F -> FF+[+F-F-F]-[-F+F+F]
 
 
 Variables: X F
 Constants: + - [ ]
 Start: X
 Rules:
 X -> F+[[X]-X]-F[-FX]+X
 F -> FF
 Angle: 25°
 
 */

String sentence;
float len = 80;
float angle = radians(25);
float thickness = 5;
color green1 = color(93, 193, 8);
color green2 = color(33, 71, 1);
int count = 0;
boolean gen=true;

void setup() {
  size(1400, 900);
  sentence = "X";
  strokeWeight(2);
  //frameRate(20);
  //for (int i=0; i<8; ++i) {
  //  generateTree();
  //}
}


void draw() {
  count++;
  background(195, 244, 240 );
  if (gen)
    update();
  generateTree();
  if (count==8) {
    gen = false;
    //noLoop();
  }
  println(count);
}

void generateTree() {
  if (gen)
    len = len*0.62;
  try {
    resetMatrix();
    translate(0, height*0.9);
    rotate(PI/3);
    for (int i=0; i<sentence.length(); ++i) {
      switch(sentence.charAt(i)) {
      case 'F':
        rotate(random(-0.001, 0.001));
        stroke(lerpColor(green1, green2, random(1)), 100);
        line(0, 0, 0, -len);
        translate(0, -len);
        break;
      case '+':
        rotate(-angle);
        break;
      case '-':
        rotate(angle);
        break;
      case '[':
        pushMatrix();
        break;
      case ']':
        popMatrix();
        break;
      }
    }
  }
  catch(Exception e) {
    println("Error");
    sentence = "X";
    len = 80;
  }
}


void update() {

  String newSentence = "";
  for (int i=0; i<sentence.length(); ++i) {
    if (sentence.charAt(i)=='F') {
      newSentence+="FF";
    } else if (sentence.charAt(i)=='X') {
      newSentence+="F+[[X]-X]-F[-FX]+X";
    } else {
      newSentence+=sentence.charAt(i);
    }
  }
  sentence = newSentence;
}
