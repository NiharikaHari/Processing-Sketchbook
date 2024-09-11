class Color {
  color colorList[];

  Color() {
    colorList = new color[3];
    colorList[0] = color(36, 252, 190);
    colorList[1] = color(190, 36, 252);
    colorList[2] = color(252, 190, 36);
  }

  color generateColor() {
    color c;
    int index1 = int(random(3));
    int index2 = int(random(3));
    float a = random(1);
    c = lerpColor(colorList[index1], colorList[index2], a);
    return c;
  }
}
