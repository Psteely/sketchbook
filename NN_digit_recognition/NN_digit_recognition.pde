 //<>// //<>//
 ArrayList <float[]> errors = new ArrayList<float[]>() ; 
 
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

  nn = new NeuralNetwork(784, 256, 10);
  //train(1);
  train(2);
  train(3);



  test();
}


void draw() {

  background(255);
   
  if (errors != null) {
   float[] pic = new float[784];
    pic = errors.get(0);
    for (int i = 0; i < 784; i++) {
      float val = pic[i];
      fill(val*255);
      rect(pixelSize * (i % 28), pixelSize * (i / 28), pixelSize, pixelSize);
    }
   
  }
}

void keyPressed() {
  println(errors.size()); 
 
}
