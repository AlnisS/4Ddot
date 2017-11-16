public class point3 {
  public float x;
  public float y;
  public float z;
  public point3() {
    this(0, 0, 0);
  }
  public point3(point3 in) {
    this.x = in.x;
    this.y = in.y;
    this.z = in.z;
  }
  public point3(float x, float y, float z) {
    this.x = x;
    this.y = y;
    this.z = z;
  }
}
public class segment3 {
  public point3 pt1;
  public point3 pt2;
  public color c;
  public segment3() {
    this(0, 0, 0, 0, 0, 0, color(0, 0, 0));
  }
  public segment3(float x1, float y1, float z1, float x2, float y2, float z2, color c) {
    this.pt1 = new point3(x1, y1, z1);
    this.pt2 = new point3(x2, y2, z2);
    this.c = c;
  }
  public segment3(point3 pt1, point3 pt2, color c) {
    this.pt1 = pt1;
    this.pt2 = pt2;
    this.c = c;
  }
  public point3 getpt1() {
    return new point3(this.pt1);
  }
  public point3 getpt2() {
    return new point3(this.pt2);
  }
}
public class RenderManager {
  public static final float CUBE_SIZE = 200;
  public static final float CL = 400;
  public static final float YOFF = 800;
  //list of line segments to render in untransformed world space
  ArrayList<segment3> renderList = new ArrayList<segment3>();
  public RenderManager() {}
  public float cubeToWorld(float in) {
    return (in-1) * CUBE_SIZE;
  }
  public point3 cubeToWorldPt3(point3 in) {
    return new point3(cubeToWorld(in.x), cubeToWorld(in.y), cubeToWorld(in.z));
  }
  public void render(float r, float rb) {
    for(segment3 seg:renderList) {
      point3 tmp1 = seg.getpt1();
      point3 tmp2 = seg.getpt2();
      tmp1 = cubeToWorldPt3(tmp1);
      tmp2 = cubeToWorldPt3(tmp2);
      tmp1 = rotatePoint(tmp1, r, rb);
      tmp2 = rotatePoint(tmp2, r, rb);
      segment3 tmp3 = new segment3(tmp1, tmp2, seg.c);
      draw3DSegment(tmp3);
    }
  }
  public point3 rotatePoint(point3 in, float r, float rb) {
    float x = in.x;
    float y = in.y;
    float z = in.z;
    float tx = x;
    float ty = y;
    float tz;
    x = tx * cos(r) - ty * sin(r);
    y = tx * sin(r) + ty * cos(r);
    ty = y;
    tz = z;
    y = ty * cos(rb) - tz * sin(rb);
    z = ty * sin(rb) + tz * cos(rb);
    point3 result = new point3(x, y, z);
    return result;
  }
  public void draw3DSegment(segment3 seg) {
    float w = width/2;
    float h = height/2;
    stroke(seg.c);
    line(w+seg.pt1.x*CL/(seg.pt1.y+YOFF), h+seg.pt1.z*CL/(seg.pt1.y+YOFF), w+seg.pt2.x*CL/(seg.pt2.y+YOFF), h+seg.pt2.z*CL/(seg.pt2.y+YOFF));
  }
}