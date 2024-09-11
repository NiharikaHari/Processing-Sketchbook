class Ball {
  PVector pos;
  int r;
  PVector dir;
  color c;

  //default starting ball
  Ball() {
    pos = new PVector(width/2, height/2);
    r = 200;
    dir = new PVector(random(-2, 2), random(-2, 2));
    //c = color(int(random(20, 200)), 0, int(random(20, 200)), 50);
    c = new Color().generateColor();
  }

  //overloaded for child balls
  Ball(PVector pos, int r) {
    this.pos = pos;
    this.r = r;
    dir = new PVector(random(-2, 2), random(-2, 2));
    c = new Color().generateColor();
  }

  //draw ball
  void show() {
    fill(c,100);
    ellipse(pos.x, pos.y, r*2, r*2);
  }

  //div r into half and return child at a random offset
  Ball child() {
    PVector pos = this.pos.copy().add(new PVector(int(random(-20, 20)), int(random(-20, 20))));
    int r = this.r / 2;
    return new Ball(pos, r);
  }

  //check if clicked on ball
  boolean isClicked(float mx, float my) {
    float dist = dist(mx, my, pos.x, pos.y);
    if (dist<r) {
      return true;
    }
    return false;
  }

  //move in dir
  void move() {
    pos.add(dir);
  }

  //change dir on hitting edges
  void bounce() {
    if (pos.x<r || pos.x>width-r) {
      dir = new PVector(dir.x*-1, dir.y);
    }
    if (pos.y<r||pos.y>height-r) {
      dir = new PVector(dir.x, dir.y*-1);
    }
  }
}
