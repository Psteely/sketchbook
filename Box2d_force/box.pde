class box {
  float ox, oy, ow, oh;
  boolean fixed;
  color col;

  Body body;


  box (float x_, float  y_, float w_, float h_, boolean f_) {
    ox = x_;
    oy = y_;
    ow = w_;
    oh = h_;
    fixed = f_;
    // Define the body   -   it's just a point

    BodyDef bd = new BodyDef();
    bd.position.set(box2d.coordPixelsToWorld(new Vec2(ox, oy)));  // convert pixels to world with CoordPixels
    if (fixed) bd.type = BodyType.STATIC;
    else bd.type = BodyType.DYNAMIC;
    //Create the body
    body = box2d.createBody(bd);
    body.setUserData(this);

    // Define the shape -- a  (this is what we use for a rectangle)
    PolygonShape sd = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(ow/2);
    float box2dH = box2d.scalarPixelsToWorld(oh/2);
    sd.setAsBox(box2dW, box2dH);

    //createt the fixture
    FixtureDef fd = new FixtureDef();
    fd.shape = sd;                       // sassign the fixture to the shape created bove.
    //parameters that effect the shape.
    fd.density = 1;
    fd.friction = 0.3;
    fd.restitution = 0.5;

    body.createFixture(fd);
    // body.setLinearVelocity(new Vec2(random(50, 55), random(2, 5)));
    body.setAngularVelocity(random(-5, 5));
  }

  void display () {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    //println(pos.x,pos.y);

    float a = body.getAngle();
    rectMode(PConstants.CENTER);

    pushMatrix();

    translate(pos.x, pos.y);
    rotate(-a);
    fill(col);

    rect(0, 0, ow, oh);
    popMatrix();
  }

  boolean contains(float x, float y) {
    Vec2 worldPoint = box2d.coordPixelsToWorld(x, y);
    Fixture f = body.getFixtureList();
    boolean inside = f.testPoint(worldPoint);
    return inside;
  }

  void applyforce(Vec2 vec) {
    Vec2 pos = body.getWorldCenter();
    body.applyForce(vec, pos);
  }

  void moveToMouse(Vec2 mouse) {
    Vec2 posW = body.getWorldCenter();
    Vec2 posP = box2d.coordWorldToPixels(posW.x, posW.y);
    //mouse.add(posP);
    if (posP.x < mouse.x) {
      posP.x = posP.x - mouse.x;
    } else posP.x = posP.x + mouse.x;
    if (posP.y < mouse.y) {
      posP.y = posP.y - mouse.y;
    } else posP.y = posP.y + mouse.y;


    posP.x=posP.x * -0.11;
    posP.y=posP.y * 0.11;

    body.applyForce(posP, posW);
    println (posP.x, mouse.x);
  }



  boolean checkIfAlive() {
    Vec2 drop = box2d.getBodyPixelCoord(body);
    if (drop.y > height) {
      // killBody();
      return true;
    }
    return false;
  }

  void killBody() {
    box2d.destroyBody(body);
  }
  
  void change(color col_) {
   col = col_; 
  }
}
