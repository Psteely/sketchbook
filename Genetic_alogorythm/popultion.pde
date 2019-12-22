import java.util.Arrays; //<>// //<>// //<>//
class population {
  int populationSize;
  String target;
  int targetLen;
  int score;
  int totalScore;


  dna[] popArray;
  dna d ;

  ArrayList <dna> pool;

  population (int ps_, String tg_, int tgLen_) {
    pool = new ArrayList  <dna>();
    targetLen = tgLen_;
    target = tg_;
    populationSize = ps_;
    popArray = new dna[ps_];
    for (int i =0; i<ps_; i++) {
      popArray[i] = new dna(tgLen_);
    }
  }
  // calculate the fitness of each member
  void fitness() {
    totalScore = 0;
    for (int i=0; i<populationSize; i++) {
      score = 0;
      for (int j=0; j<target.length(); j++) {
        //println (target.charAt(j));
        //println (popArray[i].dnaArray[j]);
        if (target.charAt(j) == popArray[i].dnaArray[j]) {
          score ++;
          totalScore ++;
          // println("hit " + i);
        }
      }
      popArray[i].popScore = score;  // every population gets its own score.
      popArray[i].fitness = float(score) / float(targetLen);
      if (score == target.length()) { 
        finished = true;
      }
    }

    sortPopulation();
  }
  // sort the population based on score.
  void sortPopulation () {
    dna temp;

    for (int i=1; i<popArray.length; i++) {
      for (int j=i; j>0; j--) {
        if (popArray[j].popScore > popArray[j-1].popScore) {
          temp = popArray[j];
          popArray[j] = popArray[j-1];
          popArray[j-1] = temp;
        }
      }
    }
    //println("sort results");
    for (int k=0; k<popArray.length; k++) {
      // printArray(popArray);
    }
  }
  // function to reproduce
  void reproduce() {
    pool.clear();
    //  use a mating pool to calculate the next parents
    float maxFitness = popArray[0].fitness;  // only works because we sorted the array.
    for (int i = 0; i<popArray.length; i++) {
      float fitness = map(popArray[i].fitness, 0, maxFitness, 0, 1);
      int n = int(fitness*100);
      for (int j = 0; j < n; j++) {
        pool.add(popArray[i]);
      }
    }
    println(pool.size());
    //  use a mating pool to calculate the next parents
    d = new dna(targetLen);
    dna[] tempArray = new dna[populationSize];
    //dna parentA = popArray[0];
    //dna parentB = popArray[1];

    for (int i = 0; i< populationSize; i++) {
      dna parentA = pool.get(int(random(pool.size())));
      dna parentB = pool.get(int(random(pool.size())));
      //dna[] temp = new dna[targetLen];

      tempArray[i] = d.offSpring(parentA, parentB, targetLen);
      //printArray (tempArray[i].dnaArray);
    }
    popArray = tempArray;
    if (!finished) {
      generation ++;
    }
  }

 // Compute average fitness for the population
  float getAverageFitness() {
    float total = 0;
    for (int i = 0; i < popArray.length; i++) {
      total += popArray[i].fitness;
    }
    return total / (popArray.length);
  }





  // get a list of all the phrases.
  String allPhrases() {
    String everything = "";

    int displayLimit = min(popArray.length, 50);


    for (int i = 0; i < displayLimit; i++) {
      everything += popArray[i].getPhrase() + " " + popArray[i].popScore + "\n";
    }
    return everything;
  }
  //  return best phrase so far.
  String getBestPhrase() {
    String bestphrase = popArray[0].getPhrase();
    return bestphrase;
  }
}
