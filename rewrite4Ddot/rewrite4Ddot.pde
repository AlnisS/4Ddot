RenderManager rm = new RenderManager();
//boolean[][][][][] = new boolean[3][3][3][3][6];//x y z w sdir
void setup() {
  size(700, 700);
  /*
  for(float z = 0; z <= 2; z+=.5) {
    rm.renderList.add(new segment3(0, 0, z, 1, 0, z, color(255, 255, 255)));
    rm.renderList.add(new segment3(0, 0, z, 0, 1, z, color(255, 255, 255)));
    rm.renderList.add(new segment3(0, 1, z, 1, 1, z, color(255, 255, 255)));
    rm.renderList.add(new segment3(1, 0, z, 1, 1, z, color(255, 255, 255)));
  }
  */
  addRectangle(rm, new point3(), sdir.yz, color(255, 255, 255));
  //addRectangle(rm, new point3(), sdir.xz, color(255, 255, 255));
  //addRectangle(rm, new point3(), sdir.yz, color(255, 255, 255));
  //addRectangle(rm, new point3(0, 0, 1), sdir.xy, color(255, 255, 255));
  //addRectangle(rm, new point3(0, 1, 0), sdir.xz, color(255, 255, 255));
  //addRectangle(rm, new point3(1, 0, 0), sdir.yz, color(255, 255, 255));
  //noLoop();
}

void draw() {
  background(0);
  rm.render(millis()/8000.0*PI, PI*sin(millis()/4000.0*PI)/20);
  //rm.render(mouseX/200.0*PI, mouseY/200.0*PI);
  //fill(255, 255, 255);
  //text(mouseX/200.0*180, 20, 20);
}