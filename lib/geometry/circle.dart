part of geometry;

class Circle extends Shape {
  Vec2 center;
  double radius;
  
  Circle(this.center, this.radius);
  
  List<Vec2> collisionAxes(Shape other) {
    if(other is Polygon)
      return other.points.map((p) => center - p);
    if(other is Line)
      return [center - other.a, center - other.b];
    if(other is Point)
      return [center - other.pos];
    if(other is Ray)
      return [center - other.origin];
  }

  Vec2 projectOnto(Vec2 axis) {
    var p = dot2(center, axis);
    return new Vec2(p - radius, p + radius);
  }
}