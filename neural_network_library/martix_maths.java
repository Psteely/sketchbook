
import processing.core.PApplet;
import processing.core.PConstants;
//import processing.core.;


class matrix { //
  int rows ;
   int cols ;
  float elements[][];    
 
  matrix () {
  }
 
  matrix (matrix m) {
    rows = m.rows;
    cols = m.cols;
    elements = m.elements;
  }

  matrix (int r_, int c_) {
    rows = r_;
    cols = c_;
    elements = new float[rows][cols];    
    for (int r= 0; r <rows; r++) {
      for  (int c= 0; c <cols; c++) {
        elements[r][c] =  0;
      }
    }
  }

  //////////////////////////////////////
  void copyMatrix (matrix m ) {
  rows = m.rows;
  cols = m.cols;
  elements = m.elements;
}
// 
  
  void fromArray( float[] in_ ) {
    for (int r= 0; r <in_.length; r++) {
      for  (int c= 0; c <1; c++) {
        elements[r][c] = in_[r];
      }
    }
  }

  float[] toArray( matrix in_ ) {
    float[] result = new float[in_.rows];
    if (in_.cols > 1) {
      
      System.out.println("Can only convert single column matrix to array");
      return result;
    }
    for (int r= 0; r <in_.rows; r++) {
      for  (int c= 0; c <1; c++) {
        result[r] = in_.elements[r][c];
      }
    }
    return result;
  }

void randomise() {
  for (int r= 0; r <rows; r++) {
    for  (int c= 0; c <cols; c++) {
      elements[r][c] =  (float)(Math.random()*1.0);
    }
  }
}

///   Print matrix for debugging

void logM() {

  //processing.core.PApplet.stroke(0);
  System.out.println(rows + "X" + cols);
  System.out.println("------------------");
  for (int r=0; r<rows; r++) { // for every column
    for (int c=0; c<cols; c++) { // for every row
      System.out.print(elements[r][c] + " ");
    }
    System.out.println();
  }
}

//Scalar functions.

void multScal ( float n) {
  //matrix mt = new matrix(rows,cols);
  for (int r= 0; r <rows; r++) {
    for  (int c= 0; c <cols; c++) {
      elements[r][c] *=  n;
    }
  }
}
void addScal ( float n) {
  for (int r= 0; r <rows; r++) {
    for  (int c= 0; c <cols; c++) {
      elements[r][c] +=  n;
    }
  }
}
//element functions.
void multElem ( matrix n) {
  for (int r= 0; r <rows; r++) {
    for  (int c= 0; c <cols; c++) {
      elements[r][c] *=  n.elements[r][c];
    }
  }
}
void addElem ( matrix n) {
  for (int r= 0; r <rows; r++) {
    for  (int c= 0; c <cols; c++) {
      elements[r][c] +=  n.elements[r][c];
    }
  }
}
//Dot Prod function.
void  dotProd ( matrix n) {
  if (cols != n.rows) {
    System.out.println("Cols of A not = Rows of B"); 
    return;
  }
  matrix result = new matrix(rows, n.cols);  // new matrix
  for (int i = 0; i < result.rows; i ++) {
    for (int j = 0; j < result.cols; j ++) {
      float sum = 0;                
      for (int k = 0; k<cols; k++) {
        sum += elements[i][k] * n.elements[k][j];
        //println(elements[i][k] * n.elements[k][j]);
      }
      result.elements[i][j] =sum;
      //println(sum);
    }
  }
  elements = null;
  elements = result.elements;
  rows = result.rows;
  cols = result.cols;
}
void transpose () {
  int newRows = cols;
  int newCols = rows;
  matrix result = new matrix(newRows, newCols);  // new matrix
  for (int r= 0; r <rows; r++) {
    for  (int c= 0; c <cols; c++) {
      result.elements[c][r] =  elements[r][c];
    }
  }
  //result.printM(1);
  elements = null;
  elements = result.elements;
  cols = newCols;
  rows = newRows;
}

void sigmoid() {
  for (int r= 0; r <rows; r++) {
    for  (int c= 0; c <cols; c++) {
      elements[r][c] = 1 / (1 + processing.core.PApplet.exp(-elements[r][c]));
    }
  }
}
}
