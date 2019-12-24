class matrix { //
  int rows ;
  int cols ;
  int elements[][];    // int just for testing
  matrix (int r_, int c_) {
    rows = r_;
    cols = c_;
    elements = new int[rows][cols];    // int just for testing
    for (int r= 0; r <rows; r++) {
      for  (int c= 0; c <cols; c++) {
        elements[r][c] =  0;
      }
    }
  }
  void randomise() {
    for (int r= 0; r <rows; r++) {
      for  (int c= 0; c <cols; c++) {
        elements[r][c] =  int(random(2, 7));    /// int just for testing
      }
    }
    
  }

  ///   Print matrix for debugging
  void printM(int n) {

    stroke(0);

    for (int r=0; r<rows; r++) { // for every column
      for (int c=0; c<cols; c++) { // for every row

        // draw rect
        fill(255); // white 
        rect(40*c+1, 30*r+(200*n), 40, 30);

        // draw text into rect
        fill(255, 0, 0); // red 
        text(elements[r][c], 40*c+1+20, 30*r+(200*n)+20);
      }
    }
  }

  //Scalar functions.

  void multScal ( int n) {
    //matrix mt = new matrix(rows,cols);
    for (int r= 0; r <rows; r++) {
      for  (int c= 0; c <cols; c++) {
        elements[r][c] *=  n;
      }
    }
  }
  void addScal ( int n) {
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
  void dotProd ( matrix n) {
    if (cols != n.rows) {
      println("Cols of A not = Rows of B"); 
      return;
    }
    matrix result = new matrix(rows, n.cols);  // new matrix
    for (int i = 0; i < result.rows; i ++) {
      for (int j = 0; j < result.cols; j ++) {
        int sum = 0;                 /// int just for testing
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
}
