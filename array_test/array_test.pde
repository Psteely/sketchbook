ArrayList<trainData> td;
void setup () {
  td = new ArrayList<trainData>(2); //<>//
  float[] in = new float[2];
  in[0] = 1.0;
  in[1] = 1.0;
  td.add( new trainData(in));
  //  in = new float[2];
  in[0] = 2;
  in[1] = 3;
  td.add( new trainData(in));
  for (trainData d : td) {
    println(d.Testinputs);
  }
}
class trainData {
  float[] Testinputs;
  trainData(float[] i_) {
    Testinputs = i_;
  }
}
