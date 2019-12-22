class joint {
  Body body;

  RevoluteJoint joint;
  arm armv;
  arm armh;
  Boolean motorOn;

  joint(float x, float y) {
    //motorOn = mo_;
    armh = new arm(x,y-20,120,10,false);
    armv = new arm(x,y,10,40,true);
    
    RevoluteJointDef rjd = new RevoluteJointDef(); 
    rjd.initialize(armh.body, armv.body, armh.body.getWorldCenter());
    
    rjd.motorSpeed = PI*2;
    rjd.maxMotorTorque = 1000.0;
    rjd.enableMotor = false;
    
    // Create the joint
    
    joint = (RevoluteJoint) box2d.world.createJoint(rjd);
  }

  void display() {
   armv.display();
   armh.display();
   
   Vec2 anchor = box2d.coordWorldToPixels(armh.body.getWorldCenter());
   fill(255,0,0);
   noStroke();
   ellipse(anchor.x,anchor.y,8,8);
   
  }
  
  void motorSwitch() {
    joint.enableMotor(!joint.isMotorEnabled());
    
  }
}
