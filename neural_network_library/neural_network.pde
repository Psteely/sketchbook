class NeuralNetwork {
  int input, hidden, output;
  
  matrix weights_IH, weights_HO, bias_H, bias_O;
  
  NeuralNetwork ( int in_, int hidden_, int out_) {
    input = in_;
    hidden = hidden_;
    output = out_;

    weights_IH = new matrix(hidden, input);    // weights between in and hidden
    weights_HO = new matrix(output, hidden);   // weights between hidden and out

    weights_IH.randomise();
    weights_HO.randomise();

    bias_H = new matrix(hidden, 1);  //weights for the bias for the hidden;
    bias_O = new matrix(output, 1);  //weights for the bias for the output;

    bias_H.randomise();
    bias_O.randomise();
  }

  float[] feedforward(float[] inArray_) {
    // generate hidden outputs
    matrix inArray = new matrix(inArray_.length, 1);
    inArray.fromArray(inArray_);   //   this is now our inpus matrix
    matrix hidden = new matrix(matrix.multiply(weights_IH,inArray));
    hidden.addMatrix(bias_H);
 
    // activation function
    hidden.sigmoid();
    // Generating output outputs.
    matrix outMatrix = new matrix(matrix.multiply(weights_HO,hidden));
    outMatrix.addMatrix(bias_O);
    outMatrix.sigmoid();
    // return as an array
    float[] ffArray = new float[output];
    ffArray = matrix.toArray(outMatrix);
    return ffArray;
    
  }
  void train (float[] inArray_) {
    
    
  }
  
}
