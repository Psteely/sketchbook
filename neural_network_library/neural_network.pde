class NeuralNetwork {
  int input, hidden, output;
  matrix infeed;
  NeuralNetwork ( int in_, int hidden_, int out_) {
    input = in_;
    hidden = hidden_;
    output = out_;
   
    matrix weights_IH = new matrix(hidden, input);    // weights between in and hidden
    weights_IH.logM();
    matrix weights_HO = new matrix(output, hidden);   // weights between hidden and out
    matrix test = new matrix();
    test.copyMatrix(weights_IH);
    test.logM();
    weights_IH.randomise();
    weights_IH.logM();
   // weights_HO.randomise();
    test.logM();
  



    matrix bias_H = new matrix(hidden, 1);  //weights for the bias for the hidden;
    matrix bias_O = new matrix(output, 1);  //weights for the bias for the output;

    //bias_H.randomise();
    //bias_O.randomise();

    //weights_IH.logM();
    //weights_HO.logM();
  }

  void feedforward(float[] inArray_) {
    infeed = new matrix(inArray_.length, 1);
    infeed.fromArray(inArray_);   //   this is now our inpus matrix


    //float[] x = infeed.toArray(infeed) ;
  }
}
