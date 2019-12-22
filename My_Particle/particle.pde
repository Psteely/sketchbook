class particle {
  PVector location;
  PVector velocity;
  PVector acc;
  float lifespan = 255;

  particle () {
    location = new PVector(width/2, 50);
    velocity = new PVector(random(-1.2,1.2), random(-2,0));
    acc = new PVector(0, 0.05);
  }


  void draw() {
    fill(0, lifespan);
    stroke(0, lifespan);
    ellipse (location.x, location.y, 10, 10);
  }

  void move() {

    velocity.add(acc);
    location.add(velocity);
    //acc.mult(0);
    lifespan -= 2;
   
  }
  
  boolean isDead() {
     if (lifespan <=0) {
      return true;
    } else return false;
  }
}
