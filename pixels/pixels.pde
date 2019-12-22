

size(640, 480);
background(0);

//for (int i=0; i <width; i++)
//  set(i, 200, color (255, 0, 0));

//loadPixels();
//pixels[9] = color(255, 0, 0);
//updatePixels();
 loadPixels(); 
for (int x = 0; x<width; x++) {
  for (int y = 0; y<height; y++) {
   float d = dist(x,y,width/2,height/2);
   int loc = (x+y*width);
    pixels[loc] = color(d, 0, 0); 
    
  }
}
updatePixels();
