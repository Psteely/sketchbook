 //<>//
ArrayList <road>  roadSegs;
ArrayList <mouse>    mice;
float zero = 0;
PVector start;
PVector end;
//mouse m;
road rd;
flowField f;

void setup () {
  size(800, 600);
  //rd = new road();

  mice = new ArrayList<mouse>();
  roadSegs = new ArrayList<road>();


  makeroad();

  mice.add(new mouse(20, 400));
  //f = new flowField();
  //f.makegrid(random(1)/8);
  //f.display();
}


void draw () {
  background(255);
  for (road rd : roadSegs) {
    rd.display();
  }

  //if (mousePressed) {
  //  if (random(1)<0.5) {
  //    mice.add(new mouse(mouseX, mouseY));
  //  }
  //if ((mice.size()) == 0) {
  //  mice.add(new mouse(mouseX, mouseY));
  //}




for (mouse m : mice) { //<>//
  m.update();
  m.follow();
  m.display();
  m.edges();
}
}

void keyPressed() {
  background(255);
  //f.makegrid(random(1)/8);
  makeroad();

  for (road rd : roadSegs) {

    rd.display();
  }
}



void makeroad() {
  //  Make road  
  roadSegs.clear();
  background(255);
  float randomY = random(400)+100;
  start = new PVector(0, randomY);
  randomY = random(400)+100;
  end = new PVector(width/3-50, randomY);
  roadSegs.add( new road(start, end));
  randomY = random(400)+100;
  PVector end1 = new PVector((width/3)*2-50, randomY);
  randomY = random(400)+100;
  PVector end2 = new PVector(width, randomY);
  roadSegs.add( new road(end, end1));
  roadSegs.add( new road(end1, end2));
}
