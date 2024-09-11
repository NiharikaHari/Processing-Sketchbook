class Cell {
  float a;
  float b;
  int x;
  int y;




  Cell(float a, float b, int x, int y) {
    this.a = a;
    this.b = b;
    this.x = x;
    this.y = y;
  }


  Cell calcNext() {
    float a_ = a+(Da*laplace("a")-a*b*b+f*(1-a))*dt;
    float b_ = b+(Db*laplace("b")+a*b*b-(k+f)*b)*dt;
    //println("a: "+a_+" , b: "+b_);
    return new Cell(a_, b_, x, y);
  }

  float laplace(String chemical) {
    float sum =0;
    //println("x: "+x+" , y: "+y);
    if (chemical.equalsIgnoreCase("a")) {
      sum+=grid[x][y].a*(-1.0);
      sum+=grid[x+1][y].a*0.2;
      sum+=grid[x-1][y].a*0.2;
      sum+=grid[x][y+1].a*0.2;
      sum+=grid[x][y-1].a*0.2;
      sum+=grid[x+1][y+1].a*0.05;
      sum+=grid[x-1][y+1].a*0.05;
      sum+=grid[x+1][y-1].a*0.05;
      sum+=grid[x-1][y-1].a*0.05;
    } else {
      sum+=grid[x][y].b*(-1.0);
      sum+=grid[x+1][y].b*0.2;
      sum+=grid[x-1][y].b*0.2;
      sum+=grid[x][y+1].b*0.2;
      sum+=grid[x][y-1].b*0.2;
      sum+=grid[x+1][y+1].b*0.05;
      sum+=grid[x-1][y+1].b*0.05;
      sum+=grid[x+1][y-1].b*0.05;
      sum+=grid[x-1][y-1].b*0.05;
    }
    return sum;
  }



  void show() {
    //float col = constrain(255*(a-b), 0, 255);
    //color c = color(col,col,255);
    //color cc = color(45, 255, 195);
    //color c = lerpColor(color(255), cc, 1-(a-b));
    color c = color(255*(a-b), 255, 255);
    pixels[x+width*y]=c;

    //for (int i=x; i<x+4; ++i) {
    //  for (int j=y; j<y+4; ++j) {
    //    int index =i+width*j;
    //    if (index<width*height)
    //      pixels[i+width*j]=c;
    //  }
    //}
  }
}
