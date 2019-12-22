class kochLine {
  PVector start;
  PVector end;

  kochLine(PVector a_, PVector b_) {
    start = a_;
    end = b_;
  }
  void display() {
    fill(0);
    strokeWeight(1);
    line (start.x,start.y,end.x,end.y);
  }
  void generate() {
    
   PVector a = start.copy();
   PVector e = end.copy();
   PVector b = a.sub(e);
   b.div(3);
   println(b.x,b.y);
    
  }
  
  
}
