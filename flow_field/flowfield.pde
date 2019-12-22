class flowField { //<>//
  PVector[][]  grid;
  int res = 20;
  int rows = width / res;
  int cols = height / res;
  flowField () {
  }

  void makegrid (float var_) {
    grid = new PVector[rows][cols];
    float xoff=0;
    for (int i=0; i<rows; i++) {
      float yoff=0;
      for (int j=0; j<cols; j++) {
        
        float theta = map(noise(xoff, yoff), 0, 1, 0, TWO_PI);
        grid[i][j] =  PVector.fromAngle(theta);
       // grid[i][j] =  new PVector(cos(theta),sin(theta));
        float x = i*res;
        float y = j*res;
        
         //  grid[i][j] =  new PVector(width/2-x,-y-10);
        yoff += var_;
      }
      xoff += var_;
    }
  }

  PVector getVec(PVector v_) {

    int row = int(v_.x/res);
    int col = int(v_.y/res);
    if (row>=rows-1)
    {   
      row=rows-1;
    }
    if (row<=0)
    {   
      row=0;
    }
    if (col>=cols-1) { 
      col =cols-1;
    }
    //println(rows);
    PVector ve = grid[row][col].copy();
  //println(row,col);
    return ve;
  }


  void display () {
    for (int i=0; i<rows; i++) {

      for (int j=0; j<cols; j++) {

        PVector v = grid[i][j].copy(); 
        float a = v.heading();
        //println(a);
        stroke(100);
        strokeWeight(1);
        pushMatrix();
        translate(i*res, j*res);

        rotate(grid[i][j].heading());
        line(0, 0, 10, 0);
        ellipse(10,0,2,2);
        popMatrix();
      }
    }
  }
}
