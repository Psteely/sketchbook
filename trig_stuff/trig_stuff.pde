
float r = 150;
float a = PI/4;  

float aVel = 0.001;
float aAcc = 0.001;

void setup() {
  size (640,360);
  
}

void draw () {
  
  background (0); //<>//
  
  translate(width/2,height/2);
  
  float x = (cos(a) * r); 
  float y = (sin(a) * r);
  fill(255);
  stroke(255);
  line(0,0,(x),(y));
  ellipse((x),(y),50,50);
  
  a= a + aVel;
  aVel = aVel + aAcc;
  
}
