import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.joints.*;

//import pbox2d.*

ArrayList <box>  boxes;
ArrayList <joint>  joints;
Box2DProcessing box2d;
scenary sc;
joint jnt;


void setup () {
  size (800, 800);

  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  boxes = new ArrayList<box>();
  joints = new ArrayList<joint>();
  sc = new scenary();
  
  
}


void draw() {
  box2d.step();     // step trgough time on each play 
  background (255);
  sc.showscene();
 
  for (box bx : boxes) {
    bx.display();
  }
  for (joint jnt : joints) {
    jnt.display();
  }
  if (mousePressed) {
    boxes.add(new box(mouseX, mouseY));
  }
}

void keyPressed() {
  joints.add(new joint(mouseX, mouseY));
}
