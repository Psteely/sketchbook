float t = 0;

void setup(){
  size (640,480);
  //frameRate(10);
  
}

void draw(){
  background (0); 
  
  //float x = random(0,width); 
  
  
  float x = noise( t  );
  x=map(x,0,1,0,width);
  t=t+0.01;
  
  
  ellipse(x,height/2,40,40);
  
}
  
