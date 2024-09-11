class Obstacle {
  int x, y, len, wid, size;

  Obstacle() {
    int area = int(random(1, 10));
    size = 20;
    len = int(random(1, 10));
    wid = int(area/len);
    x = int(random(1,width/size-1));
    y = int(random(1,height/size-1));
  }

  void show() {
    fill(150);
    rect(x*size, y*size, len*size, wid*size);
  }
}
