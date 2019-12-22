class border {

  Vec2[] vertices;



  border (float x1_, float y1_, float x2_, float y2_) { 


    vertices= new Vec2[2];
    vertices[0] = new Vec2 (box2d.coordPixelsToWorld(x1_, y1_));
    vertices[1] = new Vec2 (box2d.coordPixelsToWorld(x2_, y2_));
    //vertices[2] = new Vec2 (box2d.coordPixelsToWorld(width, height));
    //vertices[3] = new Vec2 (box2d.coordPixelsToWorld(0, height));
    //vertices[4] = new Vec2 (box2d.coordPixelsToWorld(0, 0));

    // This is what box2d uses to put the surface in its world
    ChainShape chain = new ChainShape();

    chain.createChain(vertices, vertices.length);
    // The edge chain is now a body!
    BodyDef bd = new BodyDef();
    Body body = box2d.world.createBody(bd);
    // Shortcut, we could define a fixture if we
    // want to specify frictions, restitution, etc.
    body.createFixture(chain, 2);
    body.setUserData(this);
  }

  void display () {
    stroke (0);
    strokeWeight(5);
    fill(255);
    //line(0,height-10,width,height-10);

    beginShape();
    for (int i=0; i < vertices.length; i++) {

      vertex(box2d.coordWorldToPixels(vertices[i]).x, box2d.coordWorldToPixels(vertices[i]).y);
    }
    endShape(CLOSE);
  }
}
