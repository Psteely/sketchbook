
Sun s;
Planet p;
float sunmass = 100;
float planetmass =40;
float g = 0.3;


void setup () {
  size(640,480);
  
  s = new Sun(sunmass);
  p = new Planet(planetmass);
}

void draw () {
  background(200);
 
  s.drawSun();
  s.moveSun();
  p.drawPlanet();
  p.movePlanet();
   PVector force = s.attract(p);
   p.applyForce(force);
   PVector force1 = p.attract(s);
   s.applyForce(force1);
  
}
