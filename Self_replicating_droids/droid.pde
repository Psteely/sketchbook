class droid {

  PVector pos;
  PVector vel;
  PVector acc;
  int health = 50;
  int lifespan = 0;
  float [] dna;

  float maxSpeed = 3;
  //float foodForce = random(-4, 4);
  //float poisonForce = random(-4, 4);
  //float foodViz = random(-150, 150);
  //float poisonViz = random(-150, 150);
  PVector desired;
  PVector steer;

  droid () {
    pos = new PVector(random(width), random(height));
    vel= new PVector ();
    acc= new PVector ();
    //if (dna == null) {
    dna = new float[4];
    dna[0] = random(-4, 4);
    dna[1] = random(-4, 4);
    dna[2] = random(0, 150);
    dna[3] = random(0, 150);

    //dna[0] = 4;
    //dna[1] = 0;
    //dna[2] = 150;
    //dna[3] = 0;
    //} else health = 50;
  }

  void update() {
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);

    //println(health);
  }



  void applyforce (PVector frc_) {
    frc_.normalize();

    acc.add(frc_);
  }



  void seekFood() {
    float d;
    int closestI = 0;
    float closed = width * height;  //  can't be closer than this.
    for (int i =0; i<food.size(); i++) {
      PVector tgt = new PVector(food.get(i).x, food.get(i).y);
      d = pos.dist(tgt);
      if (d < closed & d < dna[2]) {
        closed = d; 
        closestI =  i;
      }
    }
    // if we hit it then we eat it
    //if (closed < 5) {
    //  food.remove(closestI);

    //  return;
    //}
    // if we hit it then we eat it


    PVector target = new PVector();
    //target = tgt;
    if (food.size() > 0) { // only steer to food if there is any
      target = new PVector(food.get(closestI).x, food.get(closestI).y);
      desired = PVector.sub(target, pos);
      vel.limit(maxSpeed);

      steer = PVector.sub(desired, vel);
      steer.setMag(dna[0]);

      applyforce(steer);
    }
  }

  void seekPoison() {
    float d;
    int closestI = 0;
    float closed = width * height;  //  can't be closer than this.
    for (int i =0; i<poison.size(); i++) {
      PVector tgt = new PVector(poison.get(i).x, poison.get(i).y);
      d = pos.dist(tgt);
      if (d < closed & d < dna[3]) {
        closed = d; 
        closestI =  i;
      }
    }
    //// if we hit it then we eat it
    //if (closed < 5) {
    //  poison.remove(closestI);

    //  return;
    //}
    //// if we hit it then we eat it


    PVector target = new PVector();
    //target = tgt;
    if (poison.size() > 0) { // only steer to food if there is any
      target = new PVector(poison.get(closestI).x, poison.get(closestI).y);
      desired = PVector.sub(target, pos);
      vel.limit(maxSpeed);

      steer = PVector.sub(desired, vel);
      steer.setMag(dna[1]);

      applyforce(steer);
    }
  }


  int healthcheck () {
    for (int i= 0; i <poison.size(); i++) {
      float d = pos.dist(new PVector(poison.get(i).x, poison.get(i).y));
      if ( d < 5 ) {
        health = health - 2;
        poison.remove(i);  //  rempove the one we've just eaten.
        poison.add(new dot(new PVector(random(width), random(height)), 0)); // but add a new one
      }
    }
    for (int i= 0; i <food.size(); i++) {
      float d = pos.dist(new PVector(food.get(i).x, food.get(i).y));
      if ( d < 5 ) {
        health = health + 2;
        food.remove(i);  //remove the one we've eten
        food.add(new dot(new PVector(random(width), random(height)), 1)); //but add a new one
      }
    }
    // because we need to eat
    if (random(1) <.005) {
      health = health - 1;
    }


    return health;
  }

  void edges () {
    if (pos.x > width-10 || pos.x <10) {
         desired = vel;
      desired.x = desired.x * -1; 
      vel.limit(maxSpeed);

      steer = PVector.sub(desired, vel);
      steer.setMag(3);   // hrd turn from the edges

      applyforce(steer);
    }
    if (pos.y > height-10 || pos.y <10) {
         desired = vel;
      desired.y = desired.y * -1; 
      vel.limit(maxSpeed);

      steer = PVector.sub(desired, vel);
      steer.setMag(3);   // hrd turn from the edges

      applyforce(steer);
    }
    
    //pos.x = 20; 
    //if (pos.x < -20) pos.x = width-20; 
    //if (pos.y > height+20) pos.y = 20; 
    //if (pos.y < -20) pos.y = height-20;
  }






  void display() {
    float a = vel.heading();
    fill(0, 0, 255);
    stroke(0, 0, 255);
    pushMatrix();

    translate(pos.x, pos.y);
    rotate(a);
    //line (0,0,50,0);
    ellipse(0, 0, 20, 13);
    ellipse(10, 0, 15, 9);
    ellipse(15, 0, 5, 5);
    if (debug) {
      stroke (0, 255, 0);
      noFill();
      ellipse(0, 0, dna[2]*2, dna[2]*2);
      line (0, 0, map(dna[0], -5, 5, 0, 150), +2);
      stroke (255, 0, 0);
      noFill();
      ellipse(0, 0, dna[3]*2, dna[3]*2);
      line (0, 0, map(dna[1], -5, 5, 0, 150), -2);
    }


    popMatrix();
  }
}
