class Ball { //<>//
  PVector location;
  PVector velocity;
  PVector acc;
  PVector mouse;
  float x, y, xspeed, yspeed;
  float mass;
  // Constructor

  Ball (float tempX, float tempY, float tempxSPD, float tempySPD, float tempMass) {
    xspeed = tempxSPD;
    yspeed = tempySPD;
    x=tempX;
    y=tempY;
    //mass=tempMass;
    mass = random(0.5, 2);

// setup loc, vel and acc  ///   acc is zero as it's affected by calling programme
    location = new PVector((random(0, width)), height/2);
    velocity = new PVector(0, 0);
    acc = new PVector(0, 0);
  }


  void display() {

    fill(255, 0, 0); 
    ellipse(location.x, location.y, mass*20, mass*20);
  }

  void moveball() {
    //mouse = new PVector(mouseX, mouseY);
    //float d = PVector.dist(mouse, location);

    //mouse.setMag(0.1);
    //acc = mouse.sub(location);

    //float mag = acc.mag();
    //acc.setMag(mag/d);
    // println(d);

// apply the move classes
    location.add(velocity);
    velocity.add(acc);
    velocity.limit(6);
    acc.mult(0);     // clear out acceleration force so they don't accumulate
  }
  // Newton's 2nd law, with gravity 
  void applyforce(PVector force) {
    PVector f = PVector.div(force, mass);   // gravity added in from the caller
    acc.add(f);
  }

  void checkedges() {

    if ((location.x <0) || (location.x> width)) {
      velocity.x = velocity.x * -1;
    }
    if ((location.y<0) || (location.y>height)) {
      velocity.y = velocity.y * -1;
    }

    //if (location.x<0) {
    //  location.x = width;
    //}
    //if (location.x>width) {
    //  location.x = 0;
    //}
    //if (location.y<0) {
    //  location.y = height;
    //}
    //if (location.y>height) {
    //  location.y = 0;
    //}
  }
}
