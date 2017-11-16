enum dir {xp, xn, yp, yn, zp, zn, wp, wn}
enum sdir {xy, xz, yz, xw, yw, zw}
static dir[] sdirToDir(sdir sd) {
  dir[] result = new dir[2];
  switch(sd) {
    case xy:
      result[0] = dir.xp;
      result[1] = dir.yp;
      break;
    case xz:
      result[0] = dir.xp;
      result[1] = dir.zp;
      break;
    case yz:
      result[0] = dir.yp;
      result[1] = dir.zp;
      break;
    case xw:
      result[0] = dir.xp;
      result[1] = dir.wp;
      break;
    case yw:
      result[0] = dir.yp;
      result[1] = dir.wp;
      break;
    case zw:
      result[0] = dir.zp;
      result[1] = dir.wp;
      break;
  }
  return result;
}
static int[] dirToArrTsfm(dir d) {
  int[] result = new int[4];
  switch(d) {
    case xp:
      result[0] = 1;
      break;
    case xn:
      result[0] = -1;
      break;
    case yp:
      result[1] = 1;
      break;
    case yn:
      result[1] = -1;
      break;
    case zp:
      result[2] = 1;
      break;
    case zn:
      result[2] = -1;
      break;
    case wp:
      result[3] = 1;
      break;
    case wn:
      result[3] = -1;
      break;
    default:
      break;
  }
  return result;
}