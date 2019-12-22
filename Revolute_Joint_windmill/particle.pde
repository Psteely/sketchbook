


class particle {
  float ox, oy, radius;

  Body body;

  particle (float x_, float  y_, float r_) {
    ox = x_;
    oy = y_;
    radius = r_;
    // Define the body   -   it's just a point
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(ox, oy));  // convert pixels to world with CoordPixels

    //Create the body
    body = box2d.createBody(bd);

    //Create Shape
    CircleShape ci = new CircleShape();
    //CircleShape ps = new CircleShape();
    ci.m_radius = box2d.scalarPixelsToWorld(r_);

    //createt the fixture
    FixtureDef fd = new FixtureDef();
    fd.shape = ci;                       // sassign the fixture to the shape created bove.
    //parameters that effect the shape.
    fd.density = 1;
    fd.friction = 0.3;
    fd.restitution = 0.5;

    body.createFixture(fd);
    body.setAngularVelocity(random(-10, 10));
  }

  void display () {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a =body.getAngle();
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-a);
    fill(100);
    stroke(255);
    ellipse(0, 0, radius*2, radius*2);
    line(0, 0, radius, 0);
    popMatrix();
  }
}
