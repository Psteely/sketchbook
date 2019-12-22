
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
import toxi.geom.*;

VerletPhysics2D physics;
particle p1;
particle p2;
particle p3;
particle p4;
void setup() {

  size(800, 600);
  physics = new VerletPhysics2D();
  physics.setWorldBounds(new Rect(0, 0, width, height));
  physics.addBehavior(new GravityBehavior2D(new Vec2D(0, 0.5)));

  p1 = new particle(new Vec2D(width/2, 20));
  p2 = new particle(new Vec2D(width/2+160, 20));
  p3 = new particle(new Vec2D(width/2+160, 160));
  p4 = new particle(new Vec2D(width/2, 160));

  p1.lock();
  VerletSpring2D sp1 = new VerletSpring2D(p1, p2, 160, 0.01);
  VerletSpring2D sp2 = new VerletSpring2D(p2, p3, 160, 0.01);
  VerletSpring2D sp3 = new VerletSpring2D(p3, p4, 160, 0.01);
  //VerletSpring2D sp4 = new VerletSpring2D(p4, p1, 160, 0.01);
  physics.addParticle(p1);
  physics.addParticle(p2);
  physics.addParticle(p3);
  physics.addParticle(p4);
  physics.addSpring(sp1);
  physics.addSpring(sp2);
  physics.addSpring(sp3);
 // physics.addSpring(sp4);
}

void draw() {
  physics.update();
  background(255);
  p1.display();
  p2.display();
  p3.display();
  p4.display();
  line(p1.x, p1.y, p2.x, p2.y);
  line(p2.x, p2.y, p3.x, p3.y);
  line(p3.x, p3.y, p4.x, p4.y);
 // line(p4.x, p4.y, p1.x, p1.y);
  if (mousePressed) {
    p2.lock();
    p2.x = mouseX;
    p2.y = mouseY;
    p2.unlock();
  }
}
