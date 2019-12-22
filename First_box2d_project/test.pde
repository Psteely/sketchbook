class test {
  //PVector location;
  //PVector velocity;
  //PVector acc;
  Body body;
  Vec2 offset;

  float x, y;
  float w, h,r;

  test (float x_,float y_) {
    x = x_;
    y = y_;
    w=8;
    h=30;
    r=8;
    offset = new Vec2(0,h/2);
    
    // Define the body
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(x, y));  // convert pixels to world with CoordPixels

    //Create the body
    body = box2d.createBody(bd);

    //Create body
    PolygonShape ps = new PolygonShape();
    float box2Dw = box2d.scalarPixelsToWorld(w/2);   // convert pixels to word for shape /2 because world goes from centre
    float box2Dh = box2d.scalarPixelsToWorld(h/2);
    ps.setAsBox(box2Dw, box2Dh);
    // Create head
    CircleShape circle = new CircleShape();
    circle.m_radius = box2d.scalarPixelsToWorld(r);
    offset = box2d.vectorPixelsToWorld(offset);
    circle.m_p.set(offset.x,offset.y);

    //createt the fixture for body
    FixtureDef fdb = new FixtureDef();
    fdb.shape = ps;                       // sassign the fixture to the shape created bove.
    //parameters that effect the shape.
    fdb.density = 1;
    fdb.friction = 0.3;
    fdb.restitution = .5;

 //createt the fixture for head
    FixtureDef fdh = new FixtureDef();
    fdh.shape = ps;                       // sassign the fixture to the shape created bove.
    //parameters that effect the shape.
    fdh.density = 1;
    fdh.friction = 0.3;
    fdh.restitution = 0.1;

    body.createFixture(fdb);
    body.createFixture(fdh); 
    //body.createFixture(ps,1);
    //body.createFixture(circle,1);
  }

  void display () {  
    
    Vec2 pos = box2d.getBodyPixelCoord(body);   // get body location as a Box2d vector
    float a = body.getAngle();                  // grab its angle as well.
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-a);                                // negative as box world is flipped 
    stroke (0);
    strokeWeight(1);
    fill (100);
    rectMode(CENTER);
    rect(0, 0, w, h);
    //println(offset.y);
    //translate(offset.x,-offset.y);
    ellipse(0,h/2,r*2,r*2);
    popMatrix();
  }
}
