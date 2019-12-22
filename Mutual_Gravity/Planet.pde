


class Planet {
  // Angular rotation
  float angAcc = 0.001;
  float angVel = 0.0;
  float a = 0.0;
  // Vectors
  PVector location;
  PVector velocity;
  PVector acc;
  float mass;
  float r, g, b;
  float gv = 0.2;

  Planet(float m, float x, float y) {


    mass = m;
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    acc = new PVector(0, 0);

    r=random(0, 255);
    g=random(0, 255);
    b=random(0, 255);
  }
  // DRAW IT
  void drawplanet() {
    fill (r, g, b);
    pushMatrix();
    translate(location.x, location.y);
    rectMode(CENTER);
    rotate (a);

    rect(0, 0, mass*20, mass*20);

    popMatrix();
  }

  // MOVE IT
  void moveplanet() {
    // angular bit
    //angAcc = acc.mag()/10;
    angAcc = (acc.x/10 + acc.y/10)/mass;
    a = a + angVel;
    angVel  = angVel + angAcc;
    angAcc =0;

    // vector bit
    velocity.add(acc);
    location.add(velocity);
    acc.mult(0);
  }



  // APPLY FORCE
  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acc.add(f);
  }

  PVector attract(Planet p) {
    PVector force = PVector.sub(location, p.location);             // Calculate direction of force
    float distance = force.mag();                                 // Distance between objects
    distance = constrain(distance, 5.0, 25.0);                             // Limiting the distance to eliminate "extreme" results for very close or very far objects
    force.normalize();                                            // Normalize vector (distance doesn't matter here, we just want this vector for direction

    float strength = (gv * mass * p.mass) / (distance * distance); // Calculate gravitional force magnitude
    force.mult(strength);                                         // Get force vector --> magnitude * direction
    return force;
  }
}
