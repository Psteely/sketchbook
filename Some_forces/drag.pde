class drag {


  drag() {
  }
  PVector dragit(mover m) {
    PVector drag = m.Velocity.get();
    drag.normalize();
    float airD = -.01;
    drag.mult(airD);
    //m.applyforce(drag);
    return drag;
  }
}
