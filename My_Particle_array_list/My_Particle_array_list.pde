import controlP5.*; //<>// //<>//
ControlP5 cp5;
float slider = 50;
PVector gravity  = new PVector(0, 0.2);
PImage img;
ArrayList<particleSystem>  particleSystems;
void setup () {

  size(800, 800);
  img = loadImage("raindrop.png");
  particleSystems = new ArrayList<particleSystem>();
  cp5 = new ControlP5(this);
  cp5.addSlider("slider").setPosition(10, 10).setRange(-1, 1);
}

void draw() {
  background(255);

  for (particleSystem ps : particleSystems ) {
    ps.applyforce(gravity);
    ps.runSystem();
    ps.addParticle();

    if (keyPressed) {
      PVector wind = new PVector(slider, 0);
      ps.applyforce(wind);
    }
  }
}
void mousePressed() {
  if  ((mouseX >30) & (mouseY >40)) {
      particleSystems.add(new particleSystem(1, new PVector(mouseX, mouseY)));
    }
}
