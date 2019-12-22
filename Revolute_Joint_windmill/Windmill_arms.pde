

class arm {
  float ox, oy, ow, oh;
  boolean fixed;

  Body body;

  arm (float x_, float  y_, float w_, float h_, boolean f_) {
    ox = x_;
    oy = y_;
    ow = w_;
    oh = h_;
    fixed = f_;
    // Define the body   -   it's just a point
    BodyDef bd = new BodyDef();
    MouseJointDef mj = new MouseJointDef();

    bd.position.set(box2d.coordPixelsToWorld(new Vec2(ox, oy)));  // convert pixels to world with CoordPixels
    if (fixed) bd.type = BodyType.STATIC;
    else bd.type = BodyType.DYNAMIC;
    //Create the body
    body = box2d.createBody(bd);

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
    //body.setLinearVelocity(new Vec2(random(-5, 5), random(2, 5)));
    //body.setAngularVelocity(random(-5, 5));
  }

  void display () {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();
    rectMode(PConstants.CENTER);

    pushMatrix();
    
    translate(pos.x, pos.y);
    rotate(-a);
    fill(100);

    rect(0, 0, ow, oh);
    popMatrix();
  }
}
