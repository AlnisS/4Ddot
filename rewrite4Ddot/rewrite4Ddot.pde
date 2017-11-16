RenderManager rm = new RenderManager();
//boolean[][][][][] = new boolean[3][3][3][3][6];//x y z w sdir
void setup() {
  size(400, 400);
  /*
  for(float z = 0; z <= 2; z+=.5) {
    rm.renderList.add(new segment3(0, 0, z, 1, 0, z, color(255, 255, 255)));
    rm.renderList.add(new segment3(0, 0, z, 0, 1, z, color(255, 255, 255)));
    rm.renderList.add(new segment3(0, 1, z, 1, 1, z, color(255, 255, 255)));
    rm.renderList.add(new segment3(1, 0, z, 1, 1, z, color(255, 255, 255)));
  }
  */
  //addRectangle(rm, new point3(), sdir.yz, color(255, 255, 255));
  //addRectangle(rm, new point3(), sdir.xz, color(255, 255, 255));
  //addRectangle(rm, new point3(), sdir.yz, color(255, 255, 255));
  //addRectangle(rm, new point3(0, 0, 1), sdir.xy, color(255, 255, 255));
  //addRectangle(rm, new point3(0, 1, 0), sdir.xz, color(255, 255, 255));
  //addRectangle(rm, new point3(1, 0, 0), sdir.yz, color(255, 255, 255));
  //noLoop();
  for(int x = 0; x <= 2; x++) {
    for(int y = 0; y <= 2; y++) {
      for(int z = 0; z <= 2; z++) {
        if(x!=2&&y!=2) addRectangle(rm, new point3(x, y, z), sdir.xy, color(0, 255, 0));
        if(x!=2&&z!=2) addRectangle(rm, new point3(x, y, z), sdir.xz, color(0, 255, 0));
        if(y!=2&&z!=2) addRectangle(rm, new point3(x, y, z), sdir.yz, color(0, 255, 0));
      }
    }
  }
  noSmooth();
}

void draw() {
  //if(frameCount<=60){
  background(0);
  rm.render(millis()/8000.0*PI, PI*sin(millis()/4000.0*PI)/20);
  //rm.render(((float)(frameCount))/60*PI, sin(((float)(frameCount))/30*PI)/8*PI);
  //saveFrame("screen-####.png");
  //println(frameCount);
  //rm.render(mouseX/200.0*PI, mouseY/200.0*PI);
  //fill(255, 255, 255);
  //text(mouseX/200.0*180, 20, 20);
  //}
}