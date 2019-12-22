droid d; //<>// //<>//
droid nd;
PVector mouse;
ArrayList <dot> food = new ArrayList<dot>();
ArrayList <dot> poison = new ArrayList<dot>();
ArrayList <droid> droids = new ArrayList<droid>();
boolean debug = false;
void setup () {
  d = new droid();
  size (800, 800);

  for (int i =0; i<5; i++) { //add food
    food.add(new dot(new PVector(random(width), random(height)), 1));
  }
  for (int i =0; i<5; i++) { //add food
    poison.add(new dot(new PVector(random(width), random(height)), 0));
  }
  for (int i =0; i<10; i++) { //add food
    droids.add(new droid());
  }
}


void draw () {
  background (255);
  for (dot f : food) {
    f.display();
  }
  for (dot p : poison) {
    p.display();
  }
  //mouse = new PVector(mouseX, mouseY);
  for (int i=0; i<droids.size(); i++) {

    //d = droids.get(i);
    droids.get(i).display();
    droids.get(i).display();
    droids.get(i).update();
    droids.get(i).seekFood();
    droids.get(i).seekPoison();
    droids.get(i).edges();
    droids.get(i).healthcheck();
    if (droids.get(i).health <1) { 
        println ("--------------------");
      println (droids.size());   //<>//
      droids.remove(i);
    }
  }
  for (int i=0; i<droids.size(); i++) {
    if (droids.get(i).health > 52) {
      println ("+++++++++++++++++++++++");
      println (droids.size());  
      droids.get(i).health = 50;
      nd = new droid();
      //nd = droids.get(i);
      nd.pos.x = random(width);
      nd.pos.y = random(height);
      nd.dna = droids.get(i).dna;
      droids.add(nd);
    }
  }
  

}

  void keyPressed() {
    if (key == ' ') {
    debug = !debug;
    }
  }
