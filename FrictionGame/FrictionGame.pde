float floorH; //<>// //<>//
color col;

Car c;


void setup () {
  fill(100);
  size (640, 480);

  floorH = 400;
  fill (0, 255, 0);
  rect (0, floorH, width, height-floorH);
  stroke(255, 0, 0);
  strokeWeight(3);
  line (200, floorH, 350, floorH);

  c = new Car();
}
void draw() {

  c.drawcar();
  c.movecar();
  c.checkwall();
  // apply the friction force is the line is red
  col = get(int(c.location.x+30), int(floorH));
  if (red(col)==255) {
    PVector friction =  c.velocity.get();
    friction.normalize();
    float fric =-0.01;
    friction.mult(fric);
    c.applyforce(friction);
  } 

  if (mousePressed) {
    c.acc.x = .1;
    c.velocity.limit(3);
  }
  fill(200);
  stroke(200);
  rect(15,40,200,10);
  fill(255,0,0);
  text("Speeed " + c.velocity.mag(),10,50);
}
