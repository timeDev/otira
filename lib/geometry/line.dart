part of geometry;

class Line extends Shape {
  
  Vec2 a, b;
  
  Line(this.a, this.b);
  
  List<Vec2> collisionAxes(Shape other) {
    var edge = b - a;
    return [new Vec2(-edge.y, edge.x)];
  }

  Vec2 projectOnto(Vec2 axis) {
    var pa = dot2(a, axis);
    var pb = dot2(b, axis);
    return new Vec2(min(pa,pb), max(pa,pb));
  }
  
  Vec2 get center => a + (b - a).withLength((b - a).length / 2);
}