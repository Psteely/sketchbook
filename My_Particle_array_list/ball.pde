
class ball extends particle {
float lifespan = 100;
  ball (PVector l) {
     super(l);
     
    
  }
   void drawit() {
    //super.drawit();
    //ellipse (location.x, location.y, 10, 10);
    image(img,location.x, location.y, 32, 32);
  }
}
