class mover {
 // PVector Ball;
  PVector Position;
  PVector Velocity;
  PVector Acc;
  PVector force;
  float initialspeed = 6;
 
mover (float x_, float y_) {

 // Ball = new PVector();
  Position = new PVector(x_,y_);
  Velocity = new PVector(random(initialspeed*-1,initialspeed),random(initialspeed*-1,initialspeed));
  Acc = new PVector();
  
  
}

void draw () {
  
  ellipse (Position.x,Position.y,30,30);
  
}

void move() {
 Position.add(Velocity); 
 Velocity.add(Acc);
}

void applyforce(PVector force) {
  Velocity.add(force);
  Acc.add(Velocity);
  Acc.mult(0);
}
void checkedges () {
  if (Position.x > width ) { Position.x = 0; }
  if (Position.x < 0) {Position.x = width; }
  if (Position.y >height) { Position.x =0;}
  if (Position.y <0) { Position.y = height; }
    
}
  
}
