class Snake {
  PVector head;
  ArrayList<PVector> tail;
  int size;
  PVector direction;
  boolean isGrown;

  Snake() {

    head = new PVector(height/2, width/2);
    tail = new ArrayList<PVector>();
    size = 20;
    direction = new PVector(size, 0);
    isGrown = false;
  }

  void show() {
    //show head
    checkCollide();
    fill(20, 193, 17);
    rect(head.x, head.y, size, size);

    //show tail
    for (PVector t : tail) {
      rect(t.x, t.y, size, size);
    }
  }

  void move() {
    //update tail
    tail.add(head.copy());
    if (!isGrown)
      tail.remove(0);

    //update head
    head.add(direction);
    isGrown = false;
  }

  void grow() {
    isGrown = true;
  }

  void up() {
    if (!(direction.x==0 && direction.y==size))
      direction = new PVector(0, -size);
  }

  void down() {
    if (!(direction.x==0 && direction.y==-size))
      direction = new PVector(0, size);
  }

  void left() {
    if (!(direction.x==size && direction.y==0))
      direction = new PVector(-size, 0);
  }

  void right() {
    if (!(direction.x==0-size && direction.y==0))
      direction = new PVector(size, 0);
  }

  void checkCollide() {
    for (PVector t : tail) {
      if (head.x==t.x && head.y==t.y) {
        textSize(64);
        fill(253, 8, 8 );
        text("DEATH!!!", height/3, width/3);
        noLoop();
      }
    }
  }
}
