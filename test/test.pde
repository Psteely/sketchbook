Table csvReader;
void setup() {
  train(1);
  train(2);
}

void train (int num) {

  csvReader = null;
  if (num == 1) {
    println("Training table A load starts");
    csvReader = loadTable("../../bigdata/mnist_train_20000a.csv");      // read in the file
  } else if (num == 2) {
    println("Training table B load starts");
    csvReader = loadTable("../../bigdata/mnist_train_20000b.csv");      // read in the file
  }
  println("Training table load ends");
}
