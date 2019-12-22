

class road {

  PVector start;
  PVector end;
  float radius = 30;
  road(PVector s_, PVector e_) {



    //start = new PVector(0, 450);
    //end = new PVector(width, 500);

    start = s_;
    end = e_;
    //println(width);
  }

  void display () {
       
      stroke (200);
      strokeWeight(radius*2);
      line (start.x, start.y, end.x, end.y);
      stroke(0);
      strokeWeight(2);

      line (start.x, start.y, end.x, end.y);
    
  }
}
