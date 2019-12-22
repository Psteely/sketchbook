class gol {
  int w =6;
  int cols;
  int rows;

  int[][] grid;
  int[][] nextGrid;
  gol () {
  }

  void displayGrid() {
    rows = (height / w);
    cols = (width / w);
    grid = new int[cols][rows];

    //println(rows, cols);
    fill(0);
    strokeWeight(1);
    for (int i = 0; i<cols; i ++) {
      line (i*w, 0, i*w, height);
    }
    fill(0);
    strokeWeight(1);
    for (int i = 0; i<rows; i ++) {
      line (0, i*w, width, i*w);
    }
  }

  void randomise() {
    for (int i =0; i < cols; i++) {
      for (int j =0; j < rows; j++) {
        grid[i][j] = 0;
      }
    }
    for (int i =0; i < cols; i++) {
      for (int j =0; j < rows; j++) {
        if (random(1) < 0.4) {
          grid[i][j] = int(random(2));
        }
      }
    }
  }
  void displayBlob() {
    for (int i =0; i < cols; i++) {
      for (int j =0; j < rows; j++) {

        strokeWeight(1);
        //println(grid[i][j]);
        if (grid[i][j] == 1) {
          fill(0);
          rect(i*w, j*w, w, w);
        } else {
          fill(255);
          rect(i*w, j*w, w, w);
        }
      }
    }
  }
  void calc () {
    int count = 0;
    nextGrid = new int[cols][rows];
    for (int i =1; i < cols-1; i++) {
      for (int j =1; j < rows-1; j++) {

        count = (grid[i-1][j]) +(grid[i+1][j]);
        count = count + ((grid[i][j-1]) +(grid[i][j+1]));
        count = count + ((grid[i-1][j-1]) +(grid[i+1][j-1]));
        count = count + ((grid[i-1][j+1]) +(grid[i+1][j+1]));


        if (count == 3) nextGrid[i][j] =1;
        else if ((count >3) || (count <2)) nextGrid[i][j] =0;
        else nextGrid[i][j] = grid[i][j];
      }
      //displayGrid();
      count = 0;
    }
    grid = nextGrid;
  }
}
