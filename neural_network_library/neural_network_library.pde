matrix m1; //<>// //<>//
matrix m2; 
matrix mr; 
int rs = 2;
int cs = 3;   

void setup() {
 
  size(400, 400);
  m1 = new matrix(rs, cs);
  m2 = new matrix(rs, cs);
  mr = new matrix(rs, cs);
  m1.randomise();  //<>//
  m2.randomise();
 m1.multElem(m2);
}

void draw () { // draw phase
}

void keyPressed() {
 
}
 
