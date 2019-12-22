import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
//import pbox2d.*

ArrayList <box>  boxes;
Box2DProcessing box2d;
scenary sc;
test tst;


void setup () {
  size (800, 800);

  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  boxes = new ArrayList<box>();
  sc = new scenary();
  tst = new test((width/2+10),0);
}


void draw() {
  box2d.step();     // step trgough time on each play 
  background (255);
  sc.showscene();
  tst.display();
  for (box bx : boxes) {
    bx.display();
  }
  if (mousePressed) {
    boxes.add(new box(mouseX, mouseY));
  }
}

//void mousePressed() {
//  boxes.add(new box(new PVector(mouseX,mouseY)));
