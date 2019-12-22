import shiffman.box2d.*; //<>//

import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;


Box2DProcessing box2d;
joint jnt;
particle ob;
boolean motorOn;

ArrayList <particle>     particles;

particle p;
void setup () {


  size(900, 800);
  motorOn = false;



  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  particles = new ArrayList<particle>();
  //p = new particle(width/2, 5,10);
  //noLoop();
  jnt = new joint(width/2, height/2);
}

void draw () {
  box2d.step();     // step trgough time on each play 
  background(0);
  for (particle p : particles) {

    p.display();
  }
  if (random(1) < 0.1) {
    particles.add(new particle(random(width/2-200, width/2+200), -10, 10));
  }

  jnt.display();
  jnt.motorOn  = motorOn;
  //ob.display();
}

void mousePressed () {
  jnt.motorSwitch();
}
