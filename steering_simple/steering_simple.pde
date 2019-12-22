
float tail;
vehicle v;
void setup() {
  size(800, 600);
  tail = 100;

  v = new vehicle();
}

void draw () {
  background(255);

  v.update();
  v.display();
  v.checkedges();
 


  if (mousePressed) {
    v.seek(new PVector(mouseX, mouseY));
     v.arrive(new PVector(mouseX, mouseY));
    if (random(1) <0.1) {
      tail += 1;
    }
  }
  

  if (keyPressed) {

    tail = -2;
  }
}
