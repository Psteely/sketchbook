

void setup() {


  size(640, 360);
  fill (255);
  line (width/2, 0, width/2, height);
  line (0, height/2, width, height/2);
}

void draw() {

  line (width/2, 0, width/2, height);
  line (0, height/2, width, height/2);

  if (mouseX > width/2 && mouseY > height/2) {
    background(255, 0, 0);
    line (width/2, 0, width/2, height);
    line (0, height/2, width, height/2);
  } else if ((mouseX > width/2) && (mouseY < height/2)) {
    background(0, 255, 0);
    line (width/2, 0, width/2, height);
    line (0, height/2, width, height/2);
  } else if ((mouseX < width/2) && (mouseY > height/2)) {
    background(0, 0, 255);
    line (width/2, 0, width/2, height);
    line (0, height/2, width, height/2);
  } else 
  background (255);
  line (width/2, 0, width/2, height);
  line (0, height/2, width, height/2);
}
