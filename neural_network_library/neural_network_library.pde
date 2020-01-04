ArrayList<trainData> td; //<>// //<>// //<>//
float[] in = new float[2];
float[] tgts= new float[1];
float[] ffArray;
NeuralNetwork nn;
int inLayer;
int hiddenLayer;
int outputLayer;

void setup() {
  td = new ArrayList<trainData>(4); //<>//
  in[0] = 1.0;
  in[1] = 1.0;
  tgts[0] = 0;
  td.add( new trainData(in, tgts));
  in = new float[2];
  tgts= new float[1];
  in[0] = 1;
  in[1] = 0;
  tgts[0] = 1;
  td.add( new trainData(in, tgts));
  in = new float[2];
  tgts= new float[1];
  in[0] = 0;
  in[1] = 1;
  tgts[0] = 1;
  td.add( new trainData(in, tgts));
  in = new float[2];
  tgts= new float[1];
  in[0] = 0;
  in[1] = 0;
  tgts[0] = 0;
  td.add( new trainData(in, tgts));
  //
  inLayer = 2;
  hiddenLayer = 6; 
  outputLayer = 1;
  ffArray = new float[outputLayer];
  nn = new NeuralNetwork(inLayer, hiddenLayer, outputLayer);
int rnd;
for (int i=0;i<10000;i++) {
 rnd = int (random(4));
  nn.train(td.get(rnd).Testinputs, td.get(rnd).Testtargets,0.2 );
}
  ffArray = nn.feedforward(td.get(0).Testinputs);
  println(ffArray);
  ffArray = nn.feedforward(td.get(1).Testinputs);
  println(ffArray);
  ffArray = nn.feedforward(td.get(2).Testinputs);
  println(ffArray);
  ffArray = nn.feedforward(td.get(3).Testinputs);
  println(ffArray);
}

void draw () { // draw phase

}


class trainData {
  float[] Testinputs;
  float[] Testtargets;
  
  trainData(float[] i_, float[] t_) {
    Testinputs = i_;
    Testtargets = t_;
  }
}
