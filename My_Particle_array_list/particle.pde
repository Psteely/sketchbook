class particle {
  PVector location;
  PVector velocity;
  PVector acc;
  float lifespan = 300;

  particle (PVector origin_) {
    location =  origin_.copy();
    velocity = new PVector(random(-1.2, 1.2), random(-2, 0));
    acc = new PVector(0, 0.05);
  }


  void drawit() {
    decoration();
   //  ellipse (location.x, location.y, 10, 10);
  }

  void decoration () {
    fill(0, lifespan);
    stroke(0, lifespan);
  }
  
  void applyforce(PVector force) {
   acc.add(force); 
  }

  void moveit() {

    velocity.add(acc);
    location.add(velocity);
    acc.mult(0);
    lifespan -= 2;
  }

  boolean isDead() {
    if (lifespan <=0) {
      return true;
    } else return false;
  }
}
