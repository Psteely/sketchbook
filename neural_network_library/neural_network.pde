class NeuralNetwork {
  int input, hidden, output;
  float learningRate = 0.1;

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
    matrix hidden = new matrix(matrix.multiply(weights_IH, inArray));
    hidden.addMatrix(bias_H);

    // activation function
    hidden.sigmoid();
    // Generating output outputs.
    matrix outMatrix = new matrix(matrix.multiply(weights_HO, hidden));
    outMatrix.addMatrix(bias_O);
    outMatrix.sigmoid();
    // return as an array
    float[] ffArray = new float[output];
    ffArray = matrix.toArray(outMatrix);
    return ffArray;
  }
  void train (float[] inArray_, float[] targets_) {

    // generate hidden outputs
    matrix inputs = new matrix(inArray_.length, 1);
    inputs.fromArray(inArray_);   //   this is now our inpus matrix
    matrix hidden = new matrix(matrix.multiply(weights_IH, inputs));
    hidden.addMatrix(bias_H);

    // activation function
    hidden.sigmoid();
    // Generating output outputs.
    matrix outMatrix = new matrix(matrix.multiply(weights_HO, hidden));
    outMatrix.addMatrix(bias_O);
    outMatrix.sigmoid();
    /////////
    //float[] result = new float[inArray_.length];
    //result = feedforward(inArray_);  //  now we have the result as an array.
    // This is the back progation bit.
    //matrix matrixScore  = new matrix(result.length,1);
    //matrixScore.fromArray(result) ;    // score as a matrix

    matrix matrixTargets  = new matrix(targets_.length, 1);
    matrixTargets.fromArray(targets_)  ;   // targets as a matrix
    // This gives us our output errors matrix.
    //matrix output_errors  = new matrix(result.length,1);
    matrix output_errors = new matrix (matrix.subMatrix(matrixTargets, outMatrix));

    // Now we have our output and hidden errors we need the gradient descent bit. 

    outMatrix.dsigmoid();
    outMatrix.multiply(output_errors);  
    outMatrix.multiply(learningRate);
    //update bias
    bias_O.addMatrix(outMatrix);
    
    //calculate delas
    matrix hidden_T = matrix.transpose(hidden);
    matrix weight_HO_deltas = new matrix(matrix.multiply(outMatrix, hidden_T));

    //Adjust delats
    weights_HO.addMatrix(weight_HO_deltas);

    // transpose Hidden to output Weights
    matrix weights_HO_T = new matrix(matrix.transpose(weights_HO));
    // get the hidden layers errors.
    matrix hidden_errors = new matrix(matrix.multiply(weights_HO_T, output_errors));
    // hidden gradient
    hidden.dsigmoid();
    hidden.multiply(hidden_errors);
    hidden.multiply(learningRate);
    // adjust bias
    bias_H.addMatrix(hidden);
    
    //  input to hidden
    matrix inputs_T = new matrix(matrix.transpose(inputs));
    matrix weight_IH_deltas = new matrix(matrix.multiply(hidden,inputs_T));
    
    // adjust
    weights_IH.addMatrix(weight_IH_deltas);
 
    
  }
}
