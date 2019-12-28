
class matrix { //
  int rows ;
  int cols ;
  float elements[][];    


  matrix (int r_, int c_) {  //  standard constructor
    rows = r_;
    cols = c_;
    elements = new float[rows][cols];    
    for (int r= 0; r <rows; r++) {
      for  (int c= 0; c <cols; c++) {
        elements[r][c] =  0;
      }
    }
  }

  matrix (matrix m) {  // constructor for static multiplication method
    rows = m.rows;
    cols = m.cols;
    elements = m.elements;
  }


  //////////////////////////////////////

  void fromArray( float[] in_ ) {
    for (int r= 0; r <in_.length; r++) {
      for  (int c= 0; c <1; c++) {
        elements[r][c] = in_[r];
      }
    }
  }

  static float[] toArray( matrix in_ ) {
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
  // Randomise
  void randomise() {
    for (int r= 0; r <rows; r++) {
      for  (int c= 0; c <cols; c++) {
        elements[r][c] =  (float)((Math.random()*2.0)-1);
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

  // matrix maths methods 
  //

  void addMatrix ( float n) {
    for (int r= 0; r <rows; r++) {
      for  (int c= 0; c <cols; c++) {
        elements[r][c] +=  n;
      }
    }
  }
  //element functions.
  void addMatrix ( matrix n) {
    for (int r= 0; r <rows; r++) {
      for  (int c= 0; c <cols; c++) {
        elements[r][c] +=  n.elements[r][c];
      }
    }
  }

  // scalar element wise multiply  
  void multiply ( float n) {
    //matrix mt = new matrix(rows,cols);
    for (int r= 0; r <rows; r++) {
      for  (int c= 0; c <cols; c++) {
        elements[r][c] *=  n;
      }
    }
  }
  // element multiplication
  void multiply ( matrix n) {
    for (int r= 0; r <rows; r++) {
      for  (int c= 0; c <cols; c++) {
        elements[r][c] *=  n.elements[r][c];
      }
    }
  }
  //Dot Prod function. Static multiplication
  static matrix  multiply ( matrix a, matrix b) {
    if (a.cols != b.rows) {
      System.out.println("Cols of A not = Rows of B");
      return null;
    }
    matrix result = new matrix(a.rows, b.cols);  // new matrix
    for (int i = 0; i < result.rows; i ++) {
      for (int j = 0; j < result.cols; j ++) {
        float sum = 0;                
        for (int k = 0; k<a.cols; k++) {
          sum += a.elements[i][k] * b.elements[k][j];
        }
        result.elements[i][j] =sum;
      }
    }
    return result;
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
