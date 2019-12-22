PImage img;

void setup(){
  size(600,400);
  img = loadImage("shed.jpg");
}

void draw(){
  background(0);
  tint(255,0,0);
 image(img,10,10,mouseX,mouseY);
}
