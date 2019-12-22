ramp rmp1;
ramp rmp2;
floor fl;

class scenary {

  scenary () {

    fl = new floor();
    
    float x = 150;
    float y = height/2-200;
    float  w=300;
    float h=20;
    float a=10;
    rmp1 = new ramp(x, y, w, h, a);
    
    x = width-w/2;
    println(x);
    y = height/2-100;
    w=300;
    h=20;
    a=0;
    rmp2 = new ramp(x, y, w, h, a);
  }

  void showscene () {
    rmp1.display();
     rmp2.display();
     fl.drawfloor();
  }
}
