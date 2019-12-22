

import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
import toxi.geom.*;




class attractor extends VerletParticle2D {
  
 attractor(Vec2D loc) {
   
   super(loc);
 
  
   
 }
  void display() {
    
    fill(127);
    stroke(0);
    strokeWeight(2);
    ellipse(x,y,20,20);
    
    
  }
  
}
