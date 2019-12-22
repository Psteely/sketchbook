class Blob {
  float ampx = 0;
  float anglex = 0.0;
  float ampy = 0;
  float angley = 0.0;


  Blob(float amx, float anx, float amy, float angy) {
    ampx = amx;
    anglex = anx;
    ampy = amy;
    angley = angy;
  }


  void drawBlob () {

    //background(255);
    pushMatrix();
    translate (width/2, height/2);

    //float x= amp *sin ((frameCount/period)*TWO_PI);
    float x= ampx *sin (anglex);
    float y= ampx *sin (angley);
    fill(127);
    stroke(0);
    line(0, 0, x, y);
    ellipse(x, y, 36, 36);

    anglex += .01;
    angley += .01;
    popMatrix();
  }
}
