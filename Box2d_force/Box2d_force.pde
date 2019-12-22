import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

Box2DProcessing box2d;
//box bx;
border bd1;
border bd2;
border bd3;
border bd4;
ArrayList <box>    boxes;

float mass =random(5, 15);


void setup() {
  size(800, 600); 

  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.listenForCollisions();
  boxes = new ArrayList<box>();

  //bx= new box(width/2, height/2, mass, mass, false);
  bd1 = new border(0, 0, 0, height);
  bd2 = new border(width, 0, width, height);
  bd3 = new border(0+80, height, width/2 - 40, height);
  bd4 = new border(width/2 +40, height, width  - 80, height);
}


void draw() {
  box2d.step();
  if (random(1) < 0.1) {
    boxes.add (new box(random(width/2-200, width/2+200), -10, mass, mass, false));
  }

  background(255);

  bd1.display();
  bd2.display();
  bd3.display();
  bd4.display();
  //bx.display();

  for (box bxs : boxes) {
    bxs.display();
    if (keyPressed) {
      Vec2  v = new Vec2(100, 0);
      bxs.applyforce(v);
    }

    if (mousePressed) {
      Vec2  v = new Vec2(mouseX, mouseY);
      bxs.moveToMouse(v);
    }
  }
  for (int i = boxes.size()-1; i >= 0; i--) {
    box b = boxes.get(i);
    if (b.checkIfAlive()) {
      boxes.remove(i);
    }
  }
}
// This is where we control the contacts.
void beginContact(Contact cp) {
  Fixture f1 = cp.getFixtureA();
  Fixture f2 = cp.getFixtureB();

  Body b1 = f1.getBody();
  Body b2 = f2.getBody();

  Object o1 = b1.getUserData();
  Object o2 = b2.getUserData();
  if (o1.getClass() == box.class && 
    o2.getClass() == box.class) {
    box bx1 = (box) o1;
    bx1.change(color(255, 0, 0));
    box bx2 = (box) o2;
    bx2.change(color(255, 0, 0));
    }
    //if (o1.getClass() == border.class && 
    //  o2.getClass() == box.class) {
    // // box bx1 = (box) o1;
    //  //bx1.change(color(255, 0, 0));
    //  box bx2 = (box) o2;
    //  bx2.change(color(0, 255, 0));
    //}
  }
