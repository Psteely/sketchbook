//Planet p; //<>// //<>//
Planet[]  Planets = new Planet[13];
void setup () {
  fill(100);
  size(800, 600);
  background(100);

  for (int i = 0; i<Planets.length; i++) {
    Planets[i] = new Planet(random(.01,2),random(width),random(height));
  }
  
  Planets[1].mass = 10;
  Planets[1].location.x = width/2;
  Planets[1].location.y = height/2;

  //p = new Planet();
}

void draw () {
  background(100); //<>//
  for (int i = 0; i<Planets.length; i++) {
    for (int j = 0; j<Planets.length; j++) {
      if (i != j) {
        PVector force =Planets[j].attract(Planets[i]);
        Planets[i].applyForce(force);
      }
    }
    Planets[i].drawplanet();
    Planets[i].moveplanet();
  }
}
