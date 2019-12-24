matrix m1; //<>// //<>//
matrix m2; 
matrix mr; 
int rs1 = 2;
int cs1 = 4;   

int rs2 = 4;
int cs2 = 2;  

void setup() {
 
  size(400, 400);
  m1 = new matrix(rs1, cs1);
  m2 = new matrix(rs2, cs2);
  //mr = new matrix(rs, cs);
  m1.randomise();  //<>//
  m2.randomise();
 m1.dotProd(m2);
}

void draw () { // draw phase
}

void keyPressed() {
 
}
 
