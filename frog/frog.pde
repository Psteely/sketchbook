
PImage frog;



void setup() {

  size(976, 549);

  frog = loadImage("frog.jpg");
}

void draw() {

  loadPixels(); 
  for (int x = 0; x<width-1; x++) { //<>//
    for (int y = 0; y<height; y++) {
      int loc1 =  (x    +y*width);
      int loc2 = ((x+1)+y*width);
      float b1 = brightness(frog.pixels[loc1]);
      float b2 = brightness(frog.pixels[loc2]);
      float diff = abs(b1-b2);
      pixels[loc1] = color(diff);


      //float r = red(frog.pixels[loc]);
      //float b = blue(frog.pixels[loc]);
      //float g = green(frog.pixels[loc]);



      //float d = dist(mouseX,mouseY,x,y);
      //float factor = map(d,0,200,2,0);



      //pixels[loc] = color(r *factor, g*factor, b *factor);
    }
  }
  updatePixels();



  //image (frog, 0, 0);
}
