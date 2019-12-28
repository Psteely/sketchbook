

float[] inputs= {3, 4};
float[] ffArray;
NeuralNetwork nn;
int inLayer;
int hiddenLayer;
int outputLayer;

void setup() {
  inLayer = 2;
  hiddenLayer = 3; 
  outputLayer = 1;
  ffArray = new float[outputLayer];
  nn = new NeuralNetwork(inLayer, hiddenLayer, outputLayer);
  ffArray = nn.feedforward(inputs);
  println(ffArray);
}

void draw () { // draw phase
}
