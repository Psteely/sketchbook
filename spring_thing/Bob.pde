class Bob {
  PVector position;
  PVector velocity;
  PVector acc;
  float y;
  float mass =30;
  boolean dragging = false;
  PVector dragoffset;
  float damping = 0.95;
  

  Bob(float x_, float y_ ) {
    position = new PVector(x_, y_);
    velocity = new PVector(0, 0);
    acc = new PVector(0, 0);
    dragoffset = new PVector();
  }

  void drawit() {

    ellipse(position.x, position.y, mass, mass);
  }

  void moveit() {
    velocity.add(acc);
    velocity.mult(damping);
    position.add(velocity);
    acc.mult(0);
    
  }
   // Newton's law: F = M * A
  void applyForce(PVector force) {
    PVector f = force.get();
    f.div(mass);
    acc.add(f);
  }
  

  void clicked(int mx, int my) {

    float d = dist(mx,my,position.x, position.y);
    if (d <= mass) {
      dragging = true;
      dragoffset.x = position.x - mx;
      dragoffset.y = position.y - my;
    }
  }
  void stopdragging() {
    dragging = false;
  }
  void drag(int mx, int my) {
    if (dragging) {
      position.x =mx;
      position.y = my;
    }
  }
}
