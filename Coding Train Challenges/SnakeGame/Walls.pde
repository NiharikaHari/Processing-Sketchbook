class Walls {


  int size;
  ArrayList<Obstacle> obstacles;

  Walls() {
    size=20;
    obstacles = new ArrayList<Obstacle>();
  }

  void generateShowBorders() {
    fill(200);
    rect(0, 0, width, size);
    rect(0, 0, size, height);
    rect(0, height-size, width, size);
    rect(width-size, 0, size, height);
  }

  void generateObstacles() {
    int num = 10;
    for (int i=0; i<num; ++i) {
      obstacles.add(new Obstacle());
    }
  }

  void showObstacles() {
    for (Obstacle o : obstacles) {
      o.show();
    }
  }

  void checkHitWall(Snake s) {

    //check for boundary
    float x = s.head.x;
    float  y = s.head.y;
    if (x<size || x>=width-size || y<size || y>=height-size) {
      textSize(64);
      fill(253, 8, 8 );
      text("DEATH!!!", height/3, width/3);
      noLoop();
    }
  }
}
