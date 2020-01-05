void train () {
  println("Training table load starts");
  csvReader = loadTable("mnist_train_10000.csv");      // read in the file
  println("Training table load ends");
  //noStroke();
  //currentRow = (int) random(csvReader.getRowCount()-1);  
  training = new float[csvReader.getRowCount()][784];   // set up training data array
  TrainingLabel = new float[csvReader.getRowCount()][out];      // set up label array
  for (int r = 0; r< csvReader.getRowCount(); r++) {    // loop around each row for as manay as we have BIG OUTER LOOP
    csvRow = csvReader.getRow(r);                       // get the current row
    for (int l =0; l<out; l++) {                        // loop aroud the label array 10 in this case
      if (l==csvRow.getInt(0)) {                        // if array is the right one ...
        TrainingLabel[r][l] = 1;                                // ... stick a 1 in it
      } else TrainingLabel[r][l] = 0 ;                          // else a zero
    }

    for (int c = 0; c < csvReader.getColumnCount()-1; c++) { // now run around the colums 784 of them.
      float val = csvRow.getInt(c+1);                        // grab the vale for each column or pixel
      training[r][c] = val/255;                              // Add it to the training array /255 to normalise between 0 and 1
    }
  }
  // set up the nn
 
  float[] in = new float[784];                               // array for inputs
  float[] lab = new float[10];                               // array for labels
  println("Training begins");
  for (int i = 0; i <csvReader.getRowCount(); i++) {         // loop around one row
    for (int j = 0; j <784; j++) {                           // grab each training array in a loop (must be a better way to do this 
      in[j] = training[i][j];                                  // set the input array
    }
    for (int j = 0; j <10; j++) {                            // grab each label array in a loop (must be a better way to do this 
      lab[j] = TrainingLabel[i][j];                                  // set the label array
    }
     nn.train(in, lab, 0.1 );                                 // train that network
  }
  println("Training complete");
  
}
