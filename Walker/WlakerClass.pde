class Walkery {
  float x;
  float tempX;
 float y;
  float tempY;

  Walkery(float tempX,float tempY) {
    x=tempX;
    y=tempY;
  }

  void show() 
  {
    fill(255);
    ellipse (x,y,3,3);
    
  }

  void move() 
  {
    float step = random(4);
    
  }
}
