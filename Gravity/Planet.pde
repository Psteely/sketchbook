class Planet {
  float planetM;
  //PVector location;
  PVector velocity;
  PVector acc;
  float x;
  float y;
  PVector position;
  
 Planet (float temppm) {
   position = new PVector(400,10);
   //location = new PVector(0,0);
   velocity = new PVector(0,0);
   acc = new PVector(0,0);
  planetM=temppm;
 }
  
  void drawPlanet () {
    //background(200);
    fill(0,255,0);
    stroke(0,255,0);
    ellipse (position.x,position.y,planetM,planetM);
  }
  
  void movePlanet (){
    position.add(velocity);
    velocity.add(acc);
    acc.mult(0);
       
  }
   void applyForce(PVector force) {
    PVector f = PVector.div(force,planetM);
    acc.add(f);
  }
  
   PVector attract (Sun s) {
    PVector force = PVector.sub(position,s.position);
    float d = force.mag();
    force.normalize();
    
    d = constrain(d,5,25);
    
    float strength = (g*planetM*s.sunM)/(d*d);
    force.mult(strength);
    
    return force;
  }
  
}
