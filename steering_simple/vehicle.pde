class vehicle {
  PVector pos;
  PVector vel;
  PVector acc;
  PVector target;
  PVector desired;
  PVector steering;
  float maxspeed;
  float maxforce;
  float r;

  float arr[];

  ArrayList <PVector>   history;

  vehicle() {
    history = new ArrayList<PVector>();
    pos = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    // target = new PVector(mouseX, mouseY);

    r=6;
    maxspeed =4;
    maxforce =.1;
  }
  
  void checkedges () {
    if (pos.x > width-50) {
      seek(new PVector((pos.x -0.5),pos.y));
      println(pos.x);
    }
       if (pos.x < 50) {
      seek(new PVector((pos.x + 10 ),pos.y));
        println(pos.x);
    }
      if (pos.y > height-50) {
      seek(new PVector((pos.x),pos.y -10));
      println(pos.x);
    }
      if (pos.y < 50) {
      seek(new PVector((pos.x),pos.y +10));
        println(pos.x);
    }
    }

  void seek (PVector tar) {
    desired = PVector.sub(tar, pos);
    desired.setMag(maxspeed);
    steering = PVector.sub(desired, vel);
    steering.limit(maxforce);
    applyforce(steering);
  }

  void applyforce (PVector st_) {

    acc = acc.add(st_);
  }


  void arrive (PVector tar) {
    PVector desired = PVector.sub(tar, pos);
    float d = desired.mag();
    if (d < 100) {
      float m = map(d,0,100,0,maxspeed);
      desired.setMag(m);
    } else {
      desired.setMag(maxspeed);
    }
    PVector steer = PVector.sub(desired,vel);
    steer.limit(maxspeed);
    applyforce (steer);
  }




  void update () {
    pos = pos.add(vel);
    vel = vel.add(acc);
    acc = acc.mult(0);
    history.add(pos.copy());
    if (history.size()>tail) {
      history.remove(0);
    }
  }



  void display () {
    beginShape();
    stroke(0);
    noFill();
    strokeWeight(1);
    for (PVector h : history) {
      vertex(h.x, h.y);
    }
    endShape();

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
