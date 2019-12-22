class droid {
  PVector pos;
  PVector vel;
  PVector acc;
  // PVector total;
  //PVector ave;    
  //float count;
  float maxSpeed = 2.5;
  float maxForce;
  float red =0;
  float count;
  float ax;
  float ay;
  // visiblity range of the droid
  droid dd;
  // Setup ///////////////////  
  droid (float x_, float y_) {

    //total = new PVector();
    pos = new PVector (x_, y_);
    vel = new PVector (random(-2, 2), random(-2, 2));
    //vel = new PVector ();
    acc = new PVector ();
  }
  void flock (ArrayList <droid> dr) {
    steering(align(dr));    // pass in results of align to steering 
    steering(seperate(dr));    // pass in results of seperate to steering
    //steering(cohe(dr));    // pass in results of cohesion to steering
    cohe(dr);
  }


  // Work out allignmnets ////////////////////
  PVector align (ArrayList <droid> dr_) {
    red = 0;
    vis = Viz;
    PVector total =new PVector();
    PVector ave = new PVector();

    for ( droid dro : dr_) {
      float dist = pos.dist(dro.pos);  // distance between objects
      if (dist>0 & dist <vis) {
        total = PVector.add(dro.vel, total);  // add upp all the vecotrs
        count += 1;
      }
    }
    if (count >0 ) {  
      ave = PVector.div(total, count); //This should be our average velocity vector
      ave.normalize();
      maxForce = Align;
      //steering (ave);
    } 
    return ave;
  }
  // Work out seperation ////////////////////
  PVector seperate (ArrayList <droid> dr_) {
    red = 0;
    PVector total =new PVector();
    PVector ave = new PVector();

    for ( droid dr : dr_) {
      //println(droids.size());
      float dist = pos.dist(dr.pos);  // distance between objects
      if (dist > 0 && dist <vis) {
        PVector fleeVel = PVector.sub(dr.pos, pos);
        total = PVector.add(fleeVel, total);  // add upp all the vecotrs
        count += 1;
      }
      if (count >0 ) {  

        ave = PVector.div(total, count); //This should be our average velocity vector
        ave = ave.mult(-1);
        ave.normalize();
        maxForce = Seperation;
        //steering (ave);
      }
    }

    return ave;
  }

  // Work out cohesion  ////////////////////
  PVector cohe (ArrayList <droid> dr_) {
    red = 0;
    PVector total =new PVector();
    PVector ave = new PVector();
    count = 0;
    for ( droid dr : dr_) {
      //println(droids.size());
      float dist = pos.dist(dr.pos);  // distance between objects
      if (dist > 0 && dist <vis) {
        total = PVector.add(dr.pos, total);  // add upp all the vecotrs
        count += 1;
      }
    }
    if (count >0 ) {  

      ave = PVector.div(total, count); //This should be our average pos vector
      //PVector covel = pos.copy();
      //covel.normalize();

      //ave = PVector.add(ave, covel); 

      //ave.setMag(1);
      //ave.mult(-1);
      maxForce = Cohesion;
      ax = ave.x;
      ay = ave.y;
      //fill(255,0,0);
      //println(total.x,total.y,count);
      // line (pos.x, pos.y, ax, ay);
      //applyforce (ave);
    }

    PVector steer = PVector.sub(ave, pos);
    steer.normalize();
    steer.limit(maxSpeed);
    steer.mult(maxForce);
    applyforce(steer);

    return steer;
  } 


  // edge detection  //////////////////

  void edges () {

    if (pos.x > width+10) {
      pos.x = -10;
    }
    if (pos.x < -10) {
      pos.x = width+10;
    }
    if (pos.y > height+10) {
      pos.y = -10;
    }
    if (pos.y < -10) {
      pos.y = height+10;
    }
  }
  // steering //////////////////

  void steering (PVector a_) {
    if (maxForce >0) {
      PVector steer = PVector.sub(a_, vel);
      steer.normalize();
      steer.limit(maxSpeed);
      steer.mult(maxForce);
      applyforce(steer);
    }
  }

  void applyforce(PVector steer) {
    vel.add(steer);
    vel.setMag(maxSpeed);
  }
  void applyacc(PVector force) {
    // We could add mass here if we want A = F / M
    acc.add(force);
  }


  // Update ////////////////////////////
  void update() {
    pos.add(vel);
    vel.add(acc);
    acc.mult(0);
  }
  // Display //////////////////////
  void display () {
    float a = vel.heading();

    stroke (0);
    strokeWeight(1);
    pushMatrix();
    translate (pos.x, pos.y);
    if (debug) {
      noFill();
      strokeWeight(.1 );
      ellipse (0, 0, vis, vis);
    }
    fill(100);
    if (red == 1) {
      fill(255, 0, 0);
    } else fill(0, 0, 255);  
    ellipse(0, 0, 10, 10);
    rotate (a);
    fill(255, 0, 0);

    //println(ax, ay);
    line (0, 0, 15, 0);
    popMatrix();
  }
}
