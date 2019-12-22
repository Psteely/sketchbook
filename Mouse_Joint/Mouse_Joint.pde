import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.joints.*;
Box2DProcessing box2d;
box bx;
void setup() {
  
  size(600,400);
  
   box2d = new Box2DProcessing(this);
  box2d.createWorld();
  bx = new box(width/2,mouseY);
}

void draw() {
  background(255);
  
  box2d.step();
  
  bx.display();
  
}
