public void addRectangle(RenderManager rm, point3 p, sdir sd, color c) {
  dir[] d = sdirToDir(sd);
  int[] off1 = dirToArrTsfm(d[0]);
  int[] off2 = dirToArrTsfm(d[1]);
  rm.renderList.add(new segment3(p.x, p.y, p.z, p.x+off1[0], p.y+off1[1], p.z+off1[2], c));
  rm.renderList.add(new segment3(p.x, p.y, p.z, p.x+off2[0], p.y+off2[1], p.z+off2[2], c));
  rm.renderList.add(new segment3(p.x+off1[0], p.y+off1[1], p.z+off1[2],
                                 p.x+off1[0]+off2[0], p.y+off1[1]+off2[1], p.z+off1[2]+off2[2], c));
  rm.renderList.add(new segment3(p.x+off2[0], p.y+off2[1], p.z+off2[2],
                                 p.x+off1[0]+off2[0], p.y+off1[1]+off2[1], p.z+off1[2]+off2[2], c));
  println(d[0], d[1]);
  println(off1);
  println(off2);
  println(p.x, p.y, p.z, p.x+off1[0], p.y+off1[1], p.z+off1[2]);
  println(p.x, p.y, p.z, p.x+off2[0], p.y+off2[1], p.z+off2[2]);
  println(p.x+off1[0], p.y+off1[1], p.z+off1[2], p.x+off1[0]+off2[0], p.y+off1[1]+off2[1], p.z+off1[2]+off2[2]);
  println(p.x+off2[0], p.y+off2[1], p.z+off2[2], p.x+off1[0]+off2[0], p.y+off1[1]+off2[1], p.z+off1[2]+off2[2]);
}