part of geometry;

/// A point in 2D space
class Point extends Shape {
  /// The position of this [Point]
  Vec2 pos;
  
  /// Creates a new [Point].
  Point(this.pos);
  
  /// Returns a list of axes to check for collision. See [collide].
  List<Vec2> collisionAxes(Shape other) => [];

  /// Returns a (min;max) vector of the projection of this [Shape] onto [axis].
  Vec2 projectOnto(Vec2 axis) {
    var p = dot2(pos, axis);
    return new Vec2(p, p);
  }
  
  /// The center of this [Shape]
  Vec2 get center => pos;
}