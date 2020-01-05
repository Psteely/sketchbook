 //<>// //<>//

// MNIST csv are here https://pjreddie.com/projects/mnist-in-csv/ 
NeuralNetwork nn;
int in = 784;
int middle = 256;
int out = 10;
int pixelSize = 20;
float[][] training;
float[][] TrainingLabel;
float[][] testing;
float[][] TestingLabel;

Table csvReader;
TableRow csvRow;
int currentRow;



void setup() {
  surface.setSize(28 * pixelSize, 28 * pixelSize);  // only for showing the number

  nn = new NeuralNetwork(784, 128, 10);

  train();
  test();
}


void draw() {

  background(255);
  //if (training != null) {
  //  for (int i = 0; i < csvReader.getColumnCount()-1; i++) {
  //    fill(training[2][i]*255);
  //    rect(pixelSize * (i % 28), pixelSize * (i / 28), pixelSize, pixelSize);
  //  }
  //}
}

void keyPressed() {
  currentRow = (int) key-48;
  println(key);
  println(currentRow);
}
