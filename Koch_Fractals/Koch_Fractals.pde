
ArrayList <kochLine> lines;
ArrayList <kochLine> nextLine;
kochLine k;

void setup () {
  PVector start;
  PVector end;
  size(800, 600);
  background(255);
  lines = new ArrayList<kochLine>();
  start = new PVector (0, height-20);
  end = new PVector (width, height-20);

  k= new kochLine(start, end);
  k.display();
  k.generate();
}

void draw() {
}
