float r = 6; //<>// //<>//


class mouse {
  //road rd= new road();
  PVector pos;
  PVector vel;
  PVector acc;
  PVector desired;
  PVector steering;
  PVector future;
  PVector futureMag;
  PVector target;
  PVector Floc;
  PVector normalPoint;
  float maxspeed = 6;
  float maxforce = 5;
  float dist ;
  float finalDist;
  PVector finalNormal;
  float radius;
  PVector st;
  PVector en;
  //flowField fd;

  mouse(float x_, float y_) {

    pos = new PVector(x_, y_);
    vel = new PVector(random(1.5), random(0, 0));
    // vel = new PVector(3, 0);
    acc = new PVector(0, 0);
    //fd = new flowField();
  }

  void update () {
    vel.limit(maxspeed);
    pos = pos.add(vel);
    vel = vel.add(acc);
    acc = acc.mult(0);
  }

  void follow() {

    finalDist = 2000;
    futureMag = vel.copy(); 
    futureMag.setMag(50);
    future = vel.add(futureMag);  //  This is the vehicles look ahead point=
    Floc = PVector.add(future, pos);

    // Which Roadsegment are we closest to?
    for (road rd : roadSegs) {
      radius = rd.radius;
      normalPoint = getNormalPoint(Floc, rd.start, rd.end);
      if (normalPoint.x >  rd.end.x ){ 
        normalPoint = rd.end.copy();
 } //

        dist = PVector.dist(normalPoint, Floc);
        if (dist < finalDist) {
          finalNormal = normalPoint.copy();
          finalDist= dist;
          st = rd.start;
          en = rd.end;
        }

        //  println(finalDist, radius);
        if (finalDist > radius) {
          println (finalDist, dist);
          PVector dir = PVector.sub(en, st);
          dir.normalize();
          dir.mult(50);
          target = PVector.add(dir, finalNormal);
          //println(dir.x, dir.y);
          seek(finalNormal);
        }
      }
   
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
    //println(pos.y);
  }

  void seek (PVector t_) {
    //println(pos.x,pos.y);
    // PVector desired = f.getVec(pos);
    //PVector desired = t_;
    desired = PVector.sub(t_, pos);
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
    stroke(255, 0, 0);
    fill(255, 0, 0);
    rotate(-a);
    ellipse(future.x, future.y, 3, 3);  //  little red ball for the target distance.
    stroke(200);
    strokeWeight(1);
    line (0, 0, future.x, future.y);   // line between car and target.
    popMatrix();
    strokeWeight(3);
    fill(0, 0, 255);
    line (finalNormal.x, finalNormal.y, Floc.x, Floc.y);
    
    //line (target.x, target.y, Floc.x, Floc.y);
  }

  PVector getNormalPoint(PVector p, PVector a, PVector b) {
    // Vector from a to p
    PVector ap = PVector.sub(p, a);
    // Vector from a to b
    PVector ab = PVector.sub(b, a);
    ab.normalize(); // Normalize the line
    // Project vector "diff" onto line by using the dot product
    ab.mult(ap.dot(ab));
    PVector normalPoint = PVector.add(a, ab);
    return normalPoint;
  }
}
