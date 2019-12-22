 //<>// //<>//
int[] BallNums = new int[100];
Ball[] Balls = new Ball[2];
PImage[] flowers = new PImage[2];
//Ball b1;
//Ball b2;
boolean ol =false;
int total;
void setup() {
  //BallNums = new int[10];
  for (int i = 0; i < flowers.length; i  ++) {
  flowers[i] = loadImage("flower" + i + ".png");
 
  }

  size(640, 360);
 for (int i =0; i < Balls.length; i++) {
 Balls[i] = new Ball(flowers[i],i*4, 1, 1);
 
 }
  fill(255);
  background(12, 12, 255);
}
// //////////////////////////////////
void draw() {
  background(12, 12, 255);
  for (int i =0; i < total; i++) {
  
    Balls[i].displayBall();
    Balls[i].moveBall();
    Balls[i].checkEdges();
  }
  //if (b1.overlaps(b2)) {
  //  b2.changeXdirection();
  //  b2.changeYdirection();
  //}
}

void mousePressed(){
 total = total +1; 
}

void keyPressed() {
  
  total = total - 1 ;
}
