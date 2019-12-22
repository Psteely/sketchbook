float x =0;


class Car {
  PVector location;
PVector velocity;
PVector acc;
PVector friction;

  Car () {
    
    location = new PVector(x,0);
    velocity= new PVector(3,0);
    acc = new PVector(0,0);
  }

  void drawcar() {
    stroke(0, 0, 255);
    fill (0, 0, 255);
    rect (location.x, floorH-10, 30, 10);
  }

  void movecar() {
    //clear car
    stroke(200);
    fill (200);
    rect (location.x, floorH-10, 30, 10);
    //move car Vectors;
    location.add(velocity);
    velocity.add(acc);
    
    //Move car;
    
    stroke(0, 0, 255);
    fill (0, 0, 255);
    
    rect (location.x, floorH-10, 30, 10);
    //restore red line
    stroke(255, 0, 0);
    strokeWeight(3);
    line (200, floorH, 350, floorH);
  acc.mult(0);
  
  }
   
   void checkwall(){
   
    if (location.x>width) {
      location.x = 0;
   }
  
   }
  
  void applyforce(PVector force) {
    PVector f =  PVector.div(force,1);
    acc.add(f);
  }
}
