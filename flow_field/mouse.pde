float r = 6;


class mouse {
  PVector pos;
  PVector vel;
  PVector acc;
  PVector desired;
  PVector steering;
  float maxspeed = 6;
  float maxforce = .1;
  //flowField fd;

  mouse(float x_, float y_) {

    pos = new PVector(x_, y_);
    //vel = new PVector(random(.1,1.5), 0);
      vel = new PVector(3, 0);
    acc = new PVector(0, 0);
    //fd = new flowField();
  }

  void update () {
    vel.limit(maxspeed);
    pos = pos.add(vel);
    vel = vel.add(acc);
    acc = acc.mult(0);
  }
  
  void edges() {
    if (pos.x >width) {
     pos.x=0; 
    }
      if (pos.x <0 ) {
     pos.x=width; 
    }
      if (pos.y >height-2) {
     pos.y=2; 
    }
      if (pos.y <2 ) {
     pos.y=height; 
    }
    println(pos.y);
  }

  void seek () {
    //println(pos.x,pos.y);
    PVector desired = f.getVec(pos);
    //desired = PVector.sub(tar, pos);
    desired.mult(maxspeed);
    steering = PVector.sub(desired, vel);
    steering.limit(maxforce);
   // tar.setMag(maxspeed);
    applyforce(steering);
    //println(steering.x,steering.y);
  }

  void applyforce (PVector st_) {

    vel = vel.add(st_);
  //  acc = acc.mult(0);
  }


  void display () {
    //beginShape();
    //stroke(0);
    //noFill();
    //strokeWeight(1);

    //endShape();

    fill (100);
    float a = vel.heading() +PI/2;
    fill(127);
    stroke(0);
    strokeWeight(1);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(a);
    beginShape();
    vertex(0, -r*2);
    vertex(-r, r*2);
    vertex(r, r*2);
    endShape(CLOSE);
    popMatrix();
  }
}
