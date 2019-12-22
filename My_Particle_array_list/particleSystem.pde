 //<>//
class particleSystem {
  PVector origin;
  ArrayList<particle>  particles;
  int particleCount = 50;


  particleSystem(int num, PVector origin_) {
    origin= origin_.copy();
    particles = new ArrayList<particle>();

    for (int i = 0; i < num; i++) {
      particles.add(new particle(origin));
    }
  }

  void addParticle() {
    float rnd = random(1);
    if (rnd <0.4) {
      particles.add(new box(origin));
    } else 
    particles.add(new ball(origin));
  }
  void applyforce (PVector force) {
    for (particle p : particles) {
      p.applyforce(force);
    }
  }
  void runSystem() {
    for (int i = particles.size()-1; i>=0; i--) {

      particle p = particles.get(i);
      p.drawit();
      p.moveit();

      if (p.isDead()) {
        particles.remove (i);
      }
    }
  }
}
