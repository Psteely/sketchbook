 //<>//
population pop;
int poulationSize = 500;      ///  size of population
float mutationRate = .01;
PFont f;
int generation;
boolean finished = false;
int targetLength;
void setup () {
  size(1600, 800); 
  f = createFont("Courier", 32, true);
  String target = "to be or not to be that is the question";    /// target phrase
  targetLength = target.length();      /// length of target string
  pop = new population(poulationSize, target, targetLength);  // Generate initial population
}


void draw () {
  //frameRate(2);

  pop.fitness();
  displayInfo();
  pop.reproduce(); //<>//

  //pop.validate();
}

void displayInfo() {
  background(255);
  // Display current status of populationation
  String answer = pop.getBestPhrase();
  textFont(f);
  textAlign(LEFT);
  fill(0);


  textSize(24);
  text("Best phrase:", 20, 30);
  textSize(40);
  text(answer, 20, 100);

  textSize(18);
  text("total generations:     " + generation, 20, 160);
  text("average fitness:       " + nf(pop.getAverageFitness(), 0, 2), 20, 180);
  text("total population: " + poulationSize, 20, 200);
  text("mutation rate:         " + int(mutationRate * 100) + "%", 20, 220);

  textSize(18);
  text("All phrases:\n" + pop.allPhrases(), width-500, 20);
}
