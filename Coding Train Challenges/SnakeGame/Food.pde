class Food {
  PVector pos;
  int size;

  Food() {
    size = 20;
    pos = new PVector(int(random(width/size)), int(random(height/size)));
    pos.mult(size);
  }

  void show() {
    fill(247, 250, 36);
    rect(pos.x, pos.y, size, size);
  }

  boolean isEatenBy(Snake s) {
    if (s.head.x==food.pos.x && s.head.y==food.pos.y) {
      food=new Food();
      s.grow();
      return true;
    }
    return false;
  }
}
