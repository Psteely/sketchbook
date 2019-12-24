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
        elements[r][c] =  int(random(2,11));    /// int just for testing 
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
    matrix result = new matrix(n.rows, cols);  // new matrix
    for (int i = 0; i < result.rows; i ++) {
      for (int j = 0; j < result.rows; j ++) {
        int sum = 0;                 /// int just for testing
        for (int k = 0; k<cols; k++) {
          sum += elements[i][k] * n.elements[k][j];
        }
        result.elements[i][j] =sum;
      }
      //printArray(dot);
    }
  }
}
