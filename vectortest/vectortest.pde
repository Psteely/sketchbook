
Ball[] Balls;


float x;
float y;
float xspeed;
float yspeed;
float mass;
float windD;


void setup() {
  size(640, 480);

  mass = 20;
  xspeed=2.5;
  yspeed=-2;
  x=width/2;
  y=height/2;
  // Set up the balls
  Balls = new Ball[1];
  for (int i = 0; i < Balls.length; i++) {
    Balls[i] = new Ball(x, y, xspeed, yspeed, mass);
    //b = new Ball(x);
  }
}

void draw () {

  background(0);
  //Apply gravity
  for (Ball b : Balls) {   //  fror every Ball in Balls, instantiate a new ball
    PVector gravity = new PVector(0, 0.3);  // apply gravity
    gravity.mult(b.mass);    // Ball object divieds by mass, cancell that here fore gravity
    b.applyforce(gravity);

    if (mousePressed) {
    PVector friction = b.velocity.get();
    friction.normalize();
    float c =-0.1;
    friction.mult(c);
    b.applyforce(friction);
  }






  //if ( mousePressed) {
  //  PVector wind = new PVector(0.1, 0);   // apply wind.
  //  b.applyforce(wind);
  //}
  //if (mousePressed) {
  //  if (mouseX > width/ 2 ) { 
  //    windD = 0.1;
  //  } else { 
  //    windD = -0.1;
  //  }
  //}
  //PVector wind = new PVector(windD, 0);   // apply wind.
  //b.applyforce(wind);


  b.display();
  b.moveball();

  b.checkedges();
}
}
