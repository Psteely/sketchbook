import controlP5.*;

ControlP5 cp5;

int slider = 100;
ArrayList<particle>  particles;
//particle p;
//boolean isDead;
void setup () {

  size(640, 480);
  //p = new particle();
  particles = new ArrayList<particle>();
  //for (int i=0; i<10; i++) {
  //  particles.add(new particle());
  //}

  cp5 = new ControlP5(this);
  cp5.addSlider("slider").setPosition(10, 10).setRange(0, 255);
}

void draw() {
  background(255);
  fill(0);
  particles.add(new particle());

  for (int i = particles.size()-1; i>=0 ; i--) {

    particle p = particles.get(i);
    p.draw();
    p.move();

    if (p.isDead()) {
      particles.remove (i);
      
    }
    println(particles.size());
  }



  //if (particles.size() >10) {
  //  particles.remove(0);
  //}



  if (mousePressed) {
    particles.add (new particle());
  }
}
