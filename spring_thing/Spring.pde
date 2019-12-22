class Spring {

  Bob a;
  Bob b;
  float len =200;
  float k;

  Spring(Bob a_, Bob b_, float k_) {

    a=a_;
    b=b_;
    k=k_;
  }

  void drawit () {
    line (a.position.x, a.position.y, b.position.x, b.position.y);
  }

  void update() {
    // Vector pointing from anchor to bob position
    PVector force = PVector.sub(a.position, b.position);
    // What is distance
    float d = force.mag();
    // Stretch is difference between current distance and rest length
    float stretch = d - len;

    // Calculate force according to Hooke's Law
    //F = k * stretch;
    force.normalize();
    force.mult(-1 * k * stretch);
    a.applyForce(force);
    force.mult(-1);
    b.applyForce(force);
  }
}
