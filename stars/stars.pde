float mX;
float mY;

void setup() {
  size(640, 320);
   background(51);
}

void draw() {
 
  for (int i =1; i <500 ; i=i+1) {

  
    star(i+100, 10);
  }
 
}

void star(float x, float y) {

  fill(127);
  stroke(255);
  strokeWeight(2);
  beginShape();
  vertex(x, y-50);
  vertex(x+14, y-20);
  vertex(x+47, y-15);
  vertex(x+23, y+7);
  vertex(x+29, y+40);
  endShape(CLOSE);
}

void mousePressed() {
  mX=mouseX;
  mY=mouseY;
  
}
