PVector origin;
PVector bob;
float len;
float angle = 45;
float aAcc = 0;
float aVel =0;  

void setup() {
  size(640, 480); 

  len = 150;
  origin = new PVector(width/2, 0);
  bob = new PVector (width/2, len);
}

void draw() {
  background (255);

  bob.x= origin.x + len * sin(angle);
  bob.y= origin.y + len * cos(angle);

  line (origin.x, origin.y, bob.x, bob.y);
  ellipse (bob.x, bob.y, 32, 32);
  
  aAcc =-1 * sin(angle)/ len;

  angle += aVel;
  aVel += aAcc;
  
  aVel *= 0.99;
}
