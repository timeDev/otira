part of geometry;

/// A circle
class Circle extends Shape {
  
  /// The center of this [Circle]
  Vec2 center;
  
  /// The radius of this [Circle]
  double radius;
  
  /// Creates a new [Circle].
  Circle(this.center, this.radius);
  
  /// Returns a list of axes to check for collision. See [collide].
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

  /// Returns a (min;max) vector of the projection of this [Shape] onto [axis].
  Vec2 projectOnto(Vec2 axis) {
    var p = dot2(center, axis);
    return new Vec2(p - radius, p + radius);
  }
}