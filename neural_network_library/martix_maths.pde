class matrix {
  int rows ;
  int cols ;
  float elements[][];
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
  void randomise() {
    for (int r= 0; r <rows; r++) {
      for  (int c= 0; c <cols; c++) {
        elements[r][c] =  random(10);
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
    for (int r= 0; r <rows; r++) {
      for  (int c= 0; c <cols; c++) {
        elements[r][c] *=  n.elements[r][c];
      }
    }
  }
}
