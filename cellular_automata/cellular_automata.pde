automata a;
ArrayList  gens;
  void setup () {
  size(1600,600);
  a = new automata();
  background(255);
   gens = new ArrayList();
   a.initialise();
   a.display();
   //a.newrules();

}

void draw() {
   //background(255);
   a.generate();
   a.display();
   a.fullscreen();
  
  //gens.add((int) 0);
  

}
