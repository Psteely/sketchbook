import processing.core.PApplet;
import processing.core.PConstants;

float[] inputs= {3,4,5,6,7};
NeuralNetwork nn;
//matrix m  ;
void setup() {
//m = new matrix(3,2);
nn = new NeuralNetwork(2,3,1);
nn.feedforward(inputs);
}

void draw () { // draw phase
}
