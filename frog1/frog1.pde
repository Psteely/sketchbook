 //<>//
PImage frog;



void setup() {

  size(976, 549);

  frog = loadImage("frog.jpg");
  background(0);
}

void draw() {


  //image (frog, 0, 0);loat x

  for (int i =0; i<500; i++) {
    float x = random(0, width);
    float y = random(0, height);

    color c = frog.get(int(x), int(y));
    fill(c);
    noStroke();
    ellipse(x, y, 5, 5);
  }
}
