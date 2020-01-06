 import java.util.Arrays;
void test () {

  
  println("Testing table load starts");
  csvReader = loadTable("../../bigdata/mnist_test.csv");      // read in the file
  println("Testing table load ends");
  
  
  //noStroke();
  //currentRow = (int) random(csvReader.getRowCount()-1);  
  testing = new float[csvReader.getRowCount()][784];   // set up training data array
  TestingLabel = new float[csvReader.getRowCount()][out];      // set up label array
  for (int r = 0; r< csvReader.getRowCount(); r++) {    // loop around each row for as manay as we have BIG OUTER LOOP
    csvRow = csvReader.getRow(r);                       // get the current row
    for (int l =0; l<out; l++) {                        // loop aroud the label array 10 in this case
      if (l==csvRow.getInt(0)) {                        // if array is the right one ...
        TestingLabel[r][l] = 1;                                // ... stick a 1 in it
      } else TestingLabel[r][l] = 0 ;                          // else a zero
    }

    for (int c = 0; c < csvReader.getColumnCount()-1; c++) { // now run around the colums 784 of them.
      float val = csvRow.getInt(c+1);                        // grab the vale for each column or pixel
      testing[r][c] = val/255;                              // Add it to the training array /255 to normalise between 0 and 1
    }
  }
  // set up the nn
  float numRight=0;
  float percent = 0;
  float expected = 100;
  float actual = 100;
  float maxIndex = -1;
  float[] result = new float[10];
  float[] in = new float[784];                               // array for inputs
  float[] lab = new float[10];                               // array for labels
  println("Testing begins");
  for (int i = 0; i <csvReader.getRowCount(); i++) {         // loop around each row
  //for (int i = 0; i <1; i++) {                               // loop around one row
    for (int j = 0; j <784; j++) {                           // grab each training array in a loop (must be a better way to do this 
      in[j] = testing[i][j];                                  // set the input array
    }
    for (int j = 0; j <10; j++) {                            // grab each label array in a loop (must be a better way to do this 
      lab[j] = TestingLabel[i][j];                                  // set the label array
    }
    result = nn.predict(in);      // predict that network
    //Whats the expected result
    for (int r =0; r<lab.length; r++) {
      if (lab[r] == 1.0) {
        expected = r;
      }
    }
    //Whats the actual result
    float max =-100;

    for (int r =0; r<result.length; r++) {
      if (result[r] > max) {
        max = result[r];
        maxIndex= r;
      }
    }
    // whats the percentage
    

    if (expected == maxIndex) {
      numRight ++;
    } else {
      //for (int e=0;e<784;e++) {
      errors.addAll(Arrays.asList(in)); //<>//
      //}
    }
    
  }
  percent = (numRight / csvReader.getRowCount()) * 100;
  println("Testing complete");
  println("Percentage right = " + percent);
}
