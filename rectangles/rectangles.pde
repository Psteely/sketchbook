float distance;
void setup() {

  size(640, 320);
  background(0);
  strokeWeight(2);
  stroke(255);
  fill(127);
}

void draw() {
  stroke(255);
  for (int y = 0; y < height; y=y+20) {
    for (int x = 0; x < width; x=x+20) {
      distance = dist (x, y, mouseX, mouseY);
      println(distance);
      fill(255-distance/2+x,255-distance/2+y,255-distance/2);
      rect (x, y, 20, 20);
    }
  }
}
