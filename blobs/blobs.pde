Blob b;
Blob[] Blobs = new Blob[50];
//float amp = random(300,360);
//float ang = r5;
void setup() {
  size(640, 480);

  for (int i=0; i<Blobs.length; i++) {
    //b = new Blob(amp,ang);
    Blobs[i] = new Blob(random(200, 250), random(3, 5),random(200, 250),random(3, 5));
  }
}

void draw() {
  background(255);
  //b.drawBlob();

  for (int i=0; i<Blobs.length; i++) {

    Blobs[i].drawBlob();
  }
}
