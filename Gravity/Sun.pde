class Sun {
  float sunM;
  PVector position;
  PVector velocity;
  PVector acc;
  
  
 Sun (float tempsm) {
  sunM=tempsm;
  position = new  PVector(width/2,height/2);
  velocity = new PVector(0,0);
  acc = new PVector(0,0);
  
  
 }
  
  void drawSun () {
    
    fill(255,255,0);
    stroke(255,255,0);
    ellipse (position.x,position.y,20,20);
  }
    void moveSun (){
    position.add(velocity);
    velocity.add(acc);
    acc.mult(0);
       
  }
  
  PVector attract (Planet p) {
    PVector force = PVector.sub(position,p.position);
    float d = force.mag();
    force.normalize();
    
    d = constrain(d,5,25);
    
    float strength = (g* sunM*p.planetM)/(d*d);
    force.mult(strength);
    
    return force;
  }
  
     void applyForce(PVector force) {
    PVector f = PVector.div(force,sunM);
    acc.add(f);
  }
  
}
