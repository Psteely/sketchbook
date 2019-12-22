import java.util.Random;

Random generator;
int mean;
int std; 


void setup(){
 size(800,480);
 
mean = width/2;
std = 100;
 
 generator = new Random();
 background(255);
}

void draw(){
 
  
  
  float h = (float)generator.nextGaussian();
  h=(h*std) +mean;
  
  
  
  fill(0,10);
  noStroke();
  ellipse(h,height/2,10,10);
  
}
