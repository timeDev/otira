part of geometry;

/// A finite line between two points
class Line extends Shape {
  /// The start of this [Line]
  Vec2 a;
  
  /// The end of this [Line]
  Vec2 b;
  
  /// Creates a new [Line].
  Line(this.a, this.b);
  
  /// Returns a list of axes to check for collision. See [collide].
  List<Vec2> collisionAxes(Shape other) {
    var edge = b - a;
    return [new Vec2(-edge.y, edge.x)];
  }

  /// Returns a (min;max) vector of the projection of this [Shape] onto [axis].
  Vec2 projectOnto(Vec2 axis) {
    var pa = dot2(a, axis);
    var pb = dot2(b, axis);
    return new Vec2(min(pa,pb), max(pa,pb));
  }
  
  /// The center of this [Shape]
  Vec2 get center => a + (b - a).withLength((b - a).length / 2);
}