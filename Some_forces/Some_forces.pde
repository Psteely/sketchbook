PVector dragR;
mover[] movers = new mover[10];
drag d;

void setup() {
  size(640, 480);
  d = new drag();
  for (int i= 0; i<movers.length; i++)  
  {
    float x = random( 0, width);
    float y = random (0, height);
    movers[i] = new mover(x, y);
  }
}

void draw() {
  background (0);
  fill(255);
  for (int i= 0; i<movers.length; i++) 
  {
    movers[i].draw();
    movers[i].move();
    movers[i].checkedges();
    dragR = d.dragit(movers[i]);
    movers[i].applyforce(dragR);
  }
}
void mousePressed() {
  for (int i= 0; i<movers.length; i++) 
  {
    PVector wind = new PVector(2, 0);
    movers[i].applyforce(wind);
    {
    }
  }
}
