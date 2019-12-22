int sign (float in_) {
  if (in_ >=0 ) {
  return 1;
}  else return -1;
}
 float lr = 0.001;
class Perceptron {
 float weights[]; 
  Perceptron (int l_) {
    weights= new float[l_];
  
    for (int i =0; i<weights.length; i++) {
      weights[i] = random(-1,1);
    }
  }
  
  int guess (float inputs[]) {
    float sum = 0;
    for (int i=0; i<weights.length; i++) {  // calu weights * input
      sum += inputs[i] * weights[i];
    }
    //activation function to return 1 or -i
    int result = sign(sum);
    return result;
  }
  void train (float[] inputs, int target) {
    int guess = guess(inputs);
    int error = target - guess;
    for (int i=0;i<weights.length;i++) {
     weights[i] += error*inputs[i] * lr; 
    }
    
  }
  
  float guessY (float x) {
    float w0 = weights[0];
    float w1 = weights[1];
    float w2 = weights[2];
    return -(w2/w1) - (w0/w1) *x;
    
  }
}
