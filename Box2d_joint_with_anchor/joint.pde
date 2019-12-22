class joint {

  box b1;
  ball b2;
  ball b3;
  connector c1;
  Vec2 b1ap1;
  Vec2 c1ap1;


  joint(float x_, float y_) {



    float x = x_;
    float y = y_;
    float len = 2;
    b1ap1 = new Vec2(-2, -2);
    c1ap1 = new Vec2(-2, 2);

    b1 = new box(x, y);
    b2 = new ball(x, y );
    b3 = new ball(x, y);

    c1 = new connector(x-1, y-1);


    DistanceJointDef djd1= new DistanceJointDef();

    //djd1.initialize(b1.body, b2.body, b1ap1, c1ap1);
    djd1.bodyA = b1.body;
    djd1.bodyB = b2.body;

    //djd1.bodyA.GetAnchorpoint();
    djd1.length = box2d.scalarPixelsToWorld(len);
    djd1.localAnchorA.set(b1ap1);


    djd1.frequencyHz =0;
    djd1.dampingRatio = .0;

    DistanceJoint dj1 = (DistanceJoint) box2d.world.createJoint(djd1);

    DistanceJointDef djd2= new DistanceJointDef();
    djd2.bodyA = b1.body;
    djd2.bodyB = b3.body;

    djd2.length = box2d.scalarPixelsToWorld(len);
    djd2.localAnchorA.set(c1ap1);
    djd2.frequencyHz =0;
    djd2.dampingRatio = .0;

    DistanceJoint dj2 = (DistanceJoint) box2d.world.createJoint(djd2);
  }

  void display() {
    Vec2 pos1 = box2d.getBodyPixelCoord(b1.body);
    Vec2 pos2 = box2d.getBodyPixelCoord(b2.body);

    stroke(0);
    strokeWeight(2);
    // line(pos1.x, pos1.y, pos2.x, pos2.y);
    b1.display();
    b2.display();
    b3.display();
  }
}
