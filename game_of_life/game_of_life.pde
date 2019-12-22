gol g = new gol();
void setup() {
  size(1500,800);
  background(255);
  
 
  g.displayGrid();
  g.randomise();
  g.displayBlob();
}

void draw(){
  frameRate(10);
   g.calc(); //<>//
   g.displayBlob();
  
}

void keyPressed () {
  if (key == 'r') {
    g.randomise();
    g.displayBlob();
  }
   if (key == ' ') {
    g.calc();
    g.displayBlob();
  }
  
}
