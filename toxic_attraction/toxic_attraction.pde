 //<>//
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
import toxi.geom.*;

VerletPhysics2D physics;

attractor a;
ArrayList <particle>  particles;

void setup() {
  // Make some objects
  particles = new ArrayList<particle>();
  a = new attractor(new Vec2D(width/2, height/2));
  a.lock();
  size(800, 600);
  for (int i=0; i<50; i++) {
    particles.add(new particle(new Vec2D(random(width), random(height))));
  }



  //set up the physics world
  physics = new VerletPhysics2D();
  physics.setWorldBounds(new Rect(0, 0, width, height));
  physics.addBehavior(new GravityBehavior2D(new Vec2D(0, 0.0)));

  //add in the blob
  physics.addParticle(a);
 //physics.addBehavior(new AttractionBehavior2D(a, 10, -0.05));
  physics.addBehavior(new AttractionBehavior2D(a, 600, 0.1));
  for (particle p : particles) {
    physics.addParticle(p);
      //physics.addBehavior(new AttractionBehavior2D(p, 40, -0.1));
  }
}

void draw() {
  physics.update();
  background(255);

  a.display();

  for (particle p : particles) {
    p.display();
  }

  //if (mousePressed) {
  //  p1.addForce(new Vec2D(20,0));
  //}



  if (mousePressed) {
    a.lock();
    a.x = mouseX;
    a.y = mouseY;
    a.unlock();
  }

}

  void  mouseReleased() {
    a.lock();
   
  }
