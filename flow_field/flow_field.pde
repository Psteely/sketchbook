

ArrayList <mouse>    mice;
//mouse m;
flowField f;
void setup () {
  size(800, 600);
  mice = new ArrayList<mouse>();


  f = new flowField();
  f.makegrid(random(1)/8);
  f.display();
}


void draw () {
  background(255);
  f.display();

 //<>//
  if (mousePressed) {
    if (random(1)<0.5) {
      mice.add(new mouse(mouseX, mouseY));
    }
    //if ((mice.size()) == 0) {
    //  mice.add(new mouse(mouseX, mouseY));
    //}
  }

  for (mouse m : mice) {
    m.update();
    m.display();
    m.seek();
    m.edges();
  }
}

void keyPressed() {
  f.makegrid(random(1)/8);
}
