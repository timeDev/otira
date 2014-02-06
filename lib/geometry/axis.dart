part of geometry;

/// A line that is infinite in both directions
class Axis extends Shape {
  /// The origin of this [Axis]
  Vec2 origin;
  
  /// The direction of this [Axis]
  Vec2 direction;
  
  /// Creates a new [Axis].
  Axis(this.origin, this.direction);
  
  /// Returns a list of axes to check for collision. See [collide].
  List<Vec2> collisionAxes(Shape other) => [new Vec2(-direction.y,direction.x)];

  /// Returns a (min;max) vector of the projection of this [Shape] onto [axis].
  Vec2 projectOnto(Vec2 axis) {
    var p = dot2(origin, axis);
    if(p == dot2(direction, axis))
      return new Vec2(p, p);
    else
      return new Vec2(-double.INFINITY, double.INFINITY);
  }
  
  /// The center of this [Shape]
  Vec2 get center => origin;
}