Snake snake;
Food food;
Walls walls;

void setup(){
  size(600,600);
  snake = new Snake();
  food = new Food();
  walls = new Walls();
  walls.generateObstacles();
  noStroke();
  frameRate(3);
}

void draw(){
  background(0);
  walls.generateShowBorders();
  walls.showObstacles();
  food.show();
  snake.move();
  walls.checkHitWall(snake);
  snake.show();
  food.isEatenBy(snake);
}

void keyPressed(){
  if (keyCode == UP) {
    snake.up();
  }
  else if (keyCode == DOWN) {
    snake.down();
  }
  else if (keyCode == RIGHT) {
    snake.right();
  }
  else if (keyCode == LEFT) {
    snake.left();
  }
  
  
}
