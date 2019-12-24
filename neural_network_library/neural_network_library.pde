matrix m1; //<>// //<>//
matrix m2; 
matrix mr; 
int rs1 = 6;
int cs1 = 5;   

int rs2 = 5;
int cs2 = 3;  

void setup() {
 
  size(600, 600);
  m1 = new matrix(rs1, cs1);
  
  m2 = new matrix(rs2, cs2);
  //mr = new matrix(rs, cs);
  m1.randomise(); //<>//

  m1.transpose();
  m1.printM(1);
  
  
}

void draw () { // draw phase
}

void keyPressed() {
 
}
 
