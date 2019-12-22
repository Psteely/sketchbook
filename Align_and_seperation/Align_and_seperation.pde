import controlP5.*; //<>// //<>//

// Game ariables

float droidCnt = 20;    // number of seed droids //
PVector returnPos;

float Align;
float Seperation;
float Viz;
float Cohesion;
boolean debug =true;
  ControlP5 slideViz;
  ControlP5 slideSep;
  ControlP5 slideAlign;
   ControlP5 slideCohe;

float vis = 105; 
ArrayList  <droid> droids;

void setup() { 
  size (800, 600);
   slideSep = new ControlP5(this);
    slideSep.addSlider("Seperation").setPosition (10, 30).setRange(0, 1);
    slideSep.getController("Seperation").getCaptionLabel().setColor(color(0) );
    slideSep.setColorBackground(color(255, 0, 0));
    slideViz = new ControlP5(this);
    slideViz.addSlider("Viz").setPosition (10, 70).setRange(0, 400);
    slideViz.getController("Viz").getCaptionLabel().setColor(color(0) );
    slideAlign = new ControlP5(this);
    slideAlign.addSlider("Align").setPosition (10, 10).setRange(0, 1);
    slideAlign.getController("Align").getCaptionLabel().setColor(color(0) );
   slideCohe = new ControlP5(this);
    slideCohe.addSlider("Cohesion").setPosition (10, 50).setRange(0, 1);
    slideCohe.getController("Cohesion").getCaptionLabel().setColor(color(0) );
  //returnPos = new PVector();
  droids = new ArrayList<droid>();
  // droids = new ArrayList<droid>();

  //seed it with soome droids

  for (int i = 0; i<droidCnt; i++) {
    droids.add(new droid(random(0, width), random(0, height)));
  }
}

void draw() {
  background (255);
  for (droid d : droids) {
    d.update();
    d.flock(droids);
    d.edges();
    d.display();
  }

  //if (mousePressed) {
  //  droids.add(new droid(mouseX, mouseY));
  //}
}
void keyPressed() {
  if (key == 'k') {
    droids.clear();
  }
  if (key == ' ') {
    droids.add(new droid(mouseX, mouseY));
  }
  if (key == 'd') {
    debug = !debug;
  }
}
//
