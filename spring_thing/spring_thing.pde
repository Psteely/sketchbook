
Bob b1;
Bob b2;
Bob b3;
Spring s1;
Spring s2;
Spring s3;
float k =.5;
void setup () {
  size(640, 480);
  b1 = new Bob(width/2, 100); 
  b2 = new Bob(width/2, 200);
  b3 = new Bob(width/2, 300);
  s1 = new Spring(b1,b2,k);
  s2 = new Spring(b1,b3,k);
  s3 = new Spring(b2,b3,k);
}

void draw() {
  background(255);
  fill(100);

  s1.update();
  s2.update();
  s3.update();
  s1.drawit();
  s2.drawit();
  s3.drawit();
  b1.moveit();
  b1.drawit();
  b2.moveit();
  b2.drawit();
  b3.moveit();
  b3.drawit();
  
  b1.drag(mouseX, mouseY);
}

void mousePressed() {
  b1.clicked(mouseX, mouseY);
}
void mouseReleased() {
  b1.stopdragging();
}
