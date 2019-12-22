class Ball {
  float circleX ;
  float circleY ;
  float circleR;
  float xspeed ;
  float yspeed ;
  float rn;
  float d;
  PImage img;
  // ////////////////////////////////
  // constructor
  Ball(PImage temp, float tempR, float tempX, float tempY) {
    fill(255, 0, 12);
    circleX = random(0,width);
    circleY = random(0,height);
    circleR = tempR;
    xspeed = tempX;
    yspeed = tempY;
    img = temp;
  }

  void pop() {
    rn =  random (0, 255);
    fill(rn);
  }
  // ///////////////////////////////////////////////// //<>//
  boolean overlaps( Ball in) {
    d=dist(circleX, circleY, in.circleX, in.circleY);
    if (d < circleR + in.circleR) {
      return true;
    } else {
      return false;
    }
  }

  // /////////////////////////////////////////////////
  void displayBall() {
    fill(0,0,255);
  imageMode(CENTER);
  image(img,circleX,circleY,80,80);

    //ellipse(circleX, circleY, circleR, circleR);
  }
  // /////////////////////////////////////////////////////
  void moveBall() {
    circleX = circleX + xspeed;
    circleY = circleY + yspeed;
  }

  void changeXdirection() {
    xspeed = xspeed * -1;
  }
  void changeYdirection() {
    yspeed = yspeed * -1;
  }

  // /////////////////////////////////////////////////////////
  void checkEdges() {

    if ((circleX > width - circleR/2) || (circleX < circleR/2))
    {
      changeXdirection();
    }

    if ((circleY > height - circleR/2) || (circleY < circleR/2))
    {
      changeYdirection();
    }
  }
}
