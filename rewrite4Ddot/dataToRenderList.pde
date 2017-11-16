public void addRectangle(RenderManager rm, point3 p, sdir sd, color c) {
  dir[] d = sdirToDir(sd);
  int[] off1 = dirToArrTsfm(d[0]);
  int[] off2 = dirToArrTsfm(d[1]);
  if(off2[3] == 0) {//if there is no w component of rectangle
    float xin = d[0]==dir.xp?.1:0;
    float yin = (d[0]==dir.yp||d[1]==dir.yp)?.1:0;
    float zin = d[1]==dir.zp?.1:0;
    
    float x1 = p.x+xin;
    float y1 = p.y+yin;
    float z1 = p.z+zin;
    
    float x2 = p.x-xin+off1[0]+off2[0];
    float y2 = p.y-yin+off1[1]+off2[1];
    float z2 = p.z-zin+off1[2]+off2[2];
    point3 p1 = new point3(x1, y1, z1);
    point3 p2 = new point3(x2, y2, z2);
    point3 pa;
    point3 pb;
    switch(sd) {
      case xy:
        pa = new point3(x2, y1, z1);
        pb = new point3(x1, y2, z1);
        break;
      case xz:
        pa = new point3(x2, y1, z1);
        pb = new point3(x1, y1, z2);
        break;
      case yz:
        pa = new point3(x1, y2, z1);
        pb = new point3(x1, y1, z2);
        break;
      default:
        pa = new point3();
        pb = new point3();
    }
    rm.renderList.add(new segment3(p1, pa, c));
    rm.renderList.add(new segment3(p1, pb, c));
    rm.renderList.add(new segment3(pa, p2, c));
    rm.renderList.add(new segment3(pb, p2, c));
    /*
    println(p1.x, p1.y, p1.z, pa.x, pa.y, pa.z);
    println(p1.x, p1.y, p1.z, pb.x, pb.y, pb.z);
    println(pa.x, pa.y, pa.z, p2.x, p2.y, p2.z);
    println(pb.x, pb.y, pb.z, p2.x, p2.y, p2.z);
    */
    /*
    rm.renderList.add(new segment3(p.x, p.y, p.z, p.x+off1[0], p.y+off1[1], p.z+off1[2], c));
    rm.renderList.add(new segment3(p.x, p.y, p.z, p.x+off2[0], p.y+off2[1], p.z+off2[2], c));
    rm.renderList.add(new segment3(p.x+off1[0], p.y+off1[1], p.z+off1[2],
                                   p.x+off1[0]+off2[0], p.y+off1[1]+off2[1], p.z+off1[2]+off2[2], c));
    rm.renderList.add(new segment3(p.x+off2[0], p.y+off2[1], p.z+off2[2],
                                   p.x+off1[0]+off2[0], p.y+off1[1]+off2[1], p.z+off1[2]+off2[2], c));
    */
    /*
    println(p.x, p.y, p.z, p.x+off1[0], p.y+off1[1], p.z+off1[2]);
    println(p.x, p.y, p.z, p.x+off2[0], p.y+off2[1], p.z+off2[2]);
    println(p.x+off1[0], p.y+off1[1], p.z+off1[2], p.x+off1[0]+off2[0], p.y+off1[1]+off2[1], p.z+off1[2]+off2[2]);
    println(p.x+off2[0], p.y+off2[1], p.z+off2[2], p.x+off1[0]+off2[0], p.y+off1[1]+off2[1], p.z+off1[2]+off2[2]);
    */
    /*
    float xin = sd!=sdir.yz?.1:0;
    float yin = sd!=sdir.xz?.1:0;
    float zin = sd!=sdir.xy?.1:0;
    
    addRectangleSeg(p.x, p.y, p.z, p.x+off1[0], p.y+off1[1], p.z+off1[2], xin, yin, zin, c);
    addRectangleSeg(p.x, p.y, p.z, p.x+off2[0], p.y+off2[1], p.z+off2[2], xin, yin, zin, c);
    addRectangleSeg(p.x+off1[0], p.y+off1[1], p.z+off1[2],
                                   p.x+off1[0]+off2[0], p.y+off1[1]+off2[1], p.z+off1[2]+off2[2], xin, yin, zin, c);
    addRectangleSeg(p.x+off2[0], p.y+off2[1], p.z+off2[2],
                                   p.x+off1[0]+off2[0], p.y+off1[1]+off2[1], p.z+off1[2]+off2[2], xin, yin, zin, c);
    */
    /*
    rm.renderList.add(new segment3(p.x+xin, p.y+yin, p.z+zin, p.x+off1[0]-xin, p.y+off1[1]-yin, p.z+off1[2]-zin, c));
    rm.renderList.add(new segment3(p.x+xin, p.y+yin, p.z+zin, p.x+off2[0]-xin, p.y+off2[1]-yin, p.z+off2[2]-zin, c));
    rm.renderList.add(new segment3(p.x+off1[0]+xin, p.y+off1[1]+yin, p.z+off1[2]+zin,
                                   p.x+off1[0]+off2[0]-xin, p.y+off1[1]+off2[1]-yin, p.z+off1[2]+off2[2]-zin, c));
    rm.renderList.add(new segment3(p.x+off2[0]+xin, p.y+off2[1]+yin, p.z+off2[2]+zin,
                                   p.x+off1[0]+off2[0]-xin, p.y+off1[1]+off2[1]-yin, p.z+off1[2]+off2[2]-zin, c));
    
    println(p.x+xin, p.y+yin, p.z+zin, p.x+off1[0]-xin, p.y+off1[1]-yin, p.z+off1[2]-zin);
    println(p.x+xin, p.y+yin, p.z+zin, p.x+off2[0]-xin, p.y+off2[1]-yin, p.z+off2[2]-zin);
    println(p.x+off1[0]+xin, p.y+off1[1]+yin, p.z+off1[2]+zin, p.x+off1[0]+off2[0]-xin, p.y+off1[1]+off2[1]-yin, p.z+off1[2]+off2[2]-zin);
    println(p.x+off2[0]+xin, p.y+off2[1]+yin, p.z+off2[2]+zin, p.x+off1[0]+off2[0]-xin, p.y+off1[1]+off2[1]-yin, p.z+off1[2]+off2[2]-zin);
    */
  } else {//+w render
    
  }
}
public void addRectangleSeg(float x1, float y1, float z1, float x2, float y2, float z2, float xin, float yin, float zin, color c) {
  xin = x1==x2?0:.1;
  yin = y1==y2?0:.1;
  zin = z1==z2?0:.1;
  rm.renderList.add(new segment3(x1+xin, y1+yin, z1+zin, x2-xin, y2-yin, z2-zin, c));
}

public void addRectangles() {
  
}