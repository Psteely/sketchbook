class dot {
  float x;
  float y;
  int nutrition;
  dot (PVector p_, int n_) {
    x= p_.x;
    y= p_.y;
    nutrition = n_;
    
  }
  
  void display(){
    noStroke();
    if (nutrition == 1) {
      fill(0,255,0);
    } else fill(255,0,0);
      ellipse(x,y,8,8);
    
    
  }
  
}
