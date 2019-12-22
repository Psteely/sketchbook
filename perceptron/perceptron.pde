Perceptron brain; //<>//
Point[] pt = new Point[100];
float inputs[] = new float[3]; 
void setup () {
  size(600, 600);
  brain = new Perceptron(3);
  for (int i = 0; i<pt.length; i++) {
    pt[i] = new Point();
  }

  int guess = brain.guess(inputs);
  println(guess);
}

void draw () {
  background(100);
  for (int i = 0; i<pt.length; i++) {
    pt[i].display();

  }
      Point p1 = new Point (-1, brain.guessY(-1));
    Point p2 = new Point (1, brain.guessY(1));
    stroke (255);
    strokeWeight(2);

    line (p1.pixelX(p1.x), p1.pixelY(p1.y), p2.pixelX(p2.x), p2.pixelY(p2.y));

  for (int i = 0; i<pt.length; i++) {
    float[] inputs = {pt[i].x, pt[i].y, pt[i].bias};
    int target = pt[i].label;
    //brain.train(inputs, target);
    // for visualisation
    int guess = brain.guess(inputs);
    if (guess == target) {
      noStroke();
      fill(0, 255, 0);
    } else fill (255, 0, 0);
    ellipse(pt[i].px, pt[i].py, 5, 5);
  }
}         

void keyPressed() {
  for (int i = 0; i<pt.length; i++) {
    float[] inputs = {pt[i].x, pt[i].y, pt[i].bias};
    int target = pt[i].label;
    brain.train(inputs, target);
  }
}
