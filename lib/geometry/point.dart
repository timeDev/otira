part of geometry;

class Point extends Shape {
  
  Vec2 pos;
  
  Point(this.pos);
  
  List<Vec2> collisionAxes(Shape other) => [];

  Vec2 projectOnto(Vec2 axis) {
    var p = dot2(pos, axis);
    return new Vec2(p, p);
  }
}