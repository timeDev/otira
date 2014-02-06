part of geometry;

/// A line that is infinite in only one direction
class Ray extends Shape {
  /// The origin of this [Ray]
  Vec2 origin;
  
  /// The direction of this [Ray]
  Vec2 direction;
  
  /// Creates a new [Ray].
  Ray(this.origin, this.direction);
  
  /// Returns a list of axes to check for collision. See [collide].
  List<Vec2> collisionAxes(Shape other) => [new Vec2(-direction.y,direction.x)];

  /// Returns a (min;max) vector of the projection of this [Shape] onto [axis].
  Vec2 projectOnto(Vec2 axis) {
    var p1 = dot2(origin, axis);
    var p2 = dot2(direction, axis);
    if(p1 == p2)
      return new Vec2(p1, p2);
    else
      return p2 < p1 ? new Vec2(-double.INFINITY, p1) : new Vec2(p1, double.INFINITY);
  }
  
  /// The center of this [Shape]
  Vec2 get center => origin;
}