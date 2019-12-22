
float f(float x_) {
  return .6*x_ + -.2;
}

class Point {
  float x, px;
  float y, py ; 
  float bias;
  int label;
  Point (float x_, float y_) {
    x=x_;
    y=y_;
  }
  Point () {
    x = random(-1, 1);
    y = random(-1, 1);
    bias = 1;
    px = pixelX(x);
    py =  pixelY(y);



    if (y> f(x)) {

      label = 1;
    } else label=-1;
  }

  void display() {
    stroke (1);
    strokeWeight(2);
    line (0, pixelY(f(-1)), width, pixelY(f(1)));
    noStroke();
    if (label == 1) {
      fill (255);
    } else fill(0);
    ellipse (px, py, 10, 10);
  }
  float pixelX(float x_) {
    return map(x_, -1, 1, 0, width);
  }
  float pixelY(float y_) {
    return map(y_, -1, 1, height, 0 );
  }
}
