import processing.sound.*;
SoundFile sound;

ArrayList<Ball> balls;

void setup() {
  size(400, 400);
  fullScreen();
  balls = new ArrayList<Ball>();
  sound = new SoundFile(this, "bubble-pop.mp3");
  //sound.amp(0);
  balls.add(new Ball());
  noStroke();
}

void draw() {
  background(255);
  //lights();
  for (Ball b : balls) {
    b.move();
    b.bounce();
    b.show();
  }
}

void mousePressed() {
  for (int i=balls.size()-1; i>=0; --i) {
    if (balls.get(i).isClicked(mouseX, mouseY)) {
      balls.add(balls.get(i).child());
      balls.add(balls.get(i).child());
      balls.remove(i);

      sound.play();
    }
  }
}

void keyPressed() {
  Ball b = new Ball();
  balls.add(b);
}
