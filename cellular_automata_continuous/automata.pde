class automata {
  int gen[];
  int row[];
  int loop =0;
  ArrayList <int[]>  rows;
  int generation;
  int w =5;
  int[] ruleset = {0, 1, 0, 1, 1, 0, 1, 0};    // An initial rule system
  automata () {

    row = new int[width/w];  //number of cells for our window
    rows = new ArrayList<int[]>();
  }
  void nextgen() {
  }

  void initialise () {   //  initialise the first row
    for (int i=0; i < row.length; i++) {
      row[i] = 0;
    }
    row[row.length/2] = 1;
    generation = 0;
  }
  void newrules() {
    for (int i=0; i<ruleset.length; i++) {
      ruleset[i] = int(random(2));
    }
  }

  void generate () {
    int[] nextrow = new int[row.length];
    for (int i=1; i < row.length-1; i++) {
      int prev = row[i-1];
      int me = row[i];
      int next = row[i+1];
      nextrow[i] = rule(prev, me, next);
    }
    rows.add (nextrow);
    //row = nextrow;
    generation ++;
    //println(generation);
  }

  int rule(int p_, int m_, int n_) {
    if (p_ == 1 & m_ == 1 & n_ == 1) return ruleset[0];
    if (p_ == 1 & m_ == 1 & n_ == 0) return ruleset[1];
    if (p_ == 1 & m_ == 0 & n_ == 1) return ruleset[2];
    if (p_ == 1 & m_ == 0 & n_ == 0) return ruleset[3];
    if (p_ == 0 & m_ == 1 & n_ == 1) return ruleset[4];
    if (p_ == 0 & m_ == 1 & n_ == 0) return ruleset[5];
    if (p_ == 0 & m_ == 0 & n_ == 1) return ruleset[6];
    if (p_ == 0 & m_ == 0 & n_ == 0) return ruleset[7];
    return 0 ;
  }

  void displaysingle () {  ///single screen
    if (generation > height) {
      
      loop =generation;
    }
      
    for (int r=loop; r < rows.size(); r++) {
      row = rows.get(r);
      for (int i = 0; i<row.length; i++) {
        if (row[i] == 1) fill(0);
        else fill(255);
        noStroke();
        rect(i*w, w+generation *w, w, w);
        //rect(i*w, w+loop-height *w, w, w);
       
      }
      
    }
  }
  
   void display () {  //rolling screen
   
     for (int i = 0; i<row.length; i++) {
        if (row[i] == 1) fill(0);
        else fill(255);
        noStroke();
        rect(i*w, w+generation *w, w, w);
        //rect(i*w, w+loop-height *w, w, w);
       
      }
   
   }

  void fullscreen() {
    if (generation > height/w) {
      background(255);
      generation = 0;
      initialise();
      display();
      newrules();
      //println("new gen");
    }
  }
}
