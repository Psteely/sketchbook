

class box extends particle {
  float lifespan = 400;
  box (PVector l) {
    super(l);
  }

  void applyforce(PVector force) {
   acc.mult(-1);
    acc.add(force);
  }

  void drawit() {
    super.drawit();
    rectMode(CENTER);
    rect (location.x, location.y, 10, 10);
  }
}
