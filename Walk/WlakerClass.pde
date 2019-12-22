class Walker {

  float x;
  float y;
  float t = 0;
  Walker(float tempX, float tempY) {
    x=tempX;
    y=tempY;
  }

  void move() {

    
    float step = noise(t);
    
    //int choice = int(random(100));
    //if (choice < 28) {
    //  x++;
    //} else if (choice < 50) {
    //  x--;
    //} else if (choice <75) {
    //  y++;
    //} else {
    //  y--;
    //}
    //x=x+ random(-2,2);
    //y=y+ random(-2,2);
    x=constrain(step, 0, width-1);
    y=constrain(y, 0, height-1);
    t=t+0.01;
  }

  void display() {
    fill(0);
    ellipse(x, y, 2, 2);
  }
}
