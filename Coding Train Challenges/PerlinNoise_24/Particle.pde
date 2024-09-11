class Particle {

  PVector pos;
  PVector vel;
  PVector acc;
  float maxSpeed;
  PVector prevPos;

  Particle() {
    pos = new PVector(random(width), random(height));
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    maxSpeed = 3;
    prevPos = pos.copy();
  }

  void update() {
    prevPos = pos.copy();
    vel.add(acc);
    vel.limit(maxSpeed);
    pos.add(vel);
    acc.mult(0);
  }

  void applyForce(PVector force) {
    acc.add(force);
  }

  void show() {
    colorMode(HSB,360,100,100);
    stroke((zOff*100)%360,100,100,10);
    fill(0);
    line(pos.x, pos.y, prevPos.x, prevPos.y);
  }

  void move() {
    int x = floor(pos.x / scl);
    int y = floor(pos.y / scl);
    if (x<cols && y<rows && x>=0 && y>=0) {
      int index = x + y * cols;
      //println("x: "+x+" , y: "+y+" , index: "+index);
      this.applyForce(vectors[index]);
    }
  }

  void edges() {
    if (pos.x<0) {
      pos.x = width;
    }
    if (pos.x>width) {
      pos.x = 0;
    }
    if (pos.y<0) {
      pos.y = height;
    }
    if (pos.y>height) {
      pos.y = 0;
    }
  }
}
