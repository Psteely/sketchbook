class connector {
  //PVector location;
  //PVector velocity;
  //PVector acc;
  Body body;

  float x, y;
  float w, h;

  connector (float x_, float y_) {
    x = x_;
    y = y_;
    w=2;
    h=60;

    // Define the body
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(x, y));  // convert pixels to world with CoordPixels

    //Create the body
    body = box2d.createBody(bd);

    //Create Shape
    PolygonShape ps = new PolygonShape();
    float box2Dw = box2d.scalarPixelsToWorld(w/2);   // convert pixels to word for shape /2 because world goes from centre
    float box2Dh = box2d.scalarPixelsToWorld(h/2);
    ps.setAsBox(box2Dw, box2Dh);
    

    //createt the fixture
    FixtureDef fd = new FixtureDef();
    fd.shape = ps;                       // sassign the fixture to the shape created bove.
    //parameters that effect the shape.
    fd.density = 1;
    fd.friction = 0.3;
    fd.restitution = 0.5;

    body.createFixture(fd);
  }

  void display () {  
    
    Vec2 pos = box2d.getBodyPixelCoord(body);   // get body location as a Box2d vector
    float a = body.getAngle();                  // grab its angle as well.
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-a);                                // negative as box world is flipped 
    stroke (0);
    strokeWeight(1);
    fill (255,0,0);
    rectMode(CENTER);
    rect(0, 0, w, h);
    popMatrix();
  }
}
