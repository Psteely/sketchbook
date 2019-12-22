int x,y;
Walker w;

void setup() {
 size (640,480);
 x=width/2;
 y=height/2;
  
 w =new Walker(x,y);
  
}

void draw() { 
  w.display();
  w.move();
  
}
