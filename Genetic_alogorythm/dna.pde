
class dna {
  int targetSize;
  int popScore;
  float fitness;
  char dnaArray[];
  dna (int size_) {
    targetSize = size_;
    dnaArray = new char[targetSize];

    String AlphaNumericString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
      + "0123456789"
      + "abcdefghijklmnopqrstuvxyz ";
    for (int i =0; i < dnaArray.length; i++) {
      int index = int(random(AlphaNumericString.length()));
      dnaArray[i] =  AlphaNumericString.charAt(index);
    }
  }

  // Converts character array to a String
  String getPhrase() {
    return new String(dnaArray);
  }

  dna offSpring (dna a, dna b, int tgtl) {
    //println(tgtl);
    //dnaArray = null;
    // dnaArray = new char[tgtl];
    dna d = new dna(tgtl);
    for (int i =0; i<tgtl; i++) {
      //d.dnaArray[i] = a.dnaArray[i];
      if ( int(random(2)) < 1) {
        d.dnaArray[i]= a.dnaArray[i];
      } else d.dnaArray[i]= b.dnaArray[i];
    }
    //printArray(d.dnaArray);  
     // possible mutation
      String AlphaNumericString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
      + "0123456789"
      + "abcdefghijklmnopqrstuvxyz ";
      int index = int(random(AlphaNumericString.length()));
     if (random(1) < mutationRate ) {
       d.dnaArray[int(random(tgtl))] = AlphaNumericString.charAt(index);
     }
         return d;
  }
}
