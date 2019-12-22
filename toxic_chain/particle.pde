

import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
import toxi.geom.*;




class particle extends VerletParticle2D {
  
 particle(Vec2D loc) {
   
   super(loc);
   
 }
  void display() {
    
    fill(127);
    stroke(0);
    strokeWeight(2);
    ellipse(x,y,32,32);
    
    
  }
  
}
