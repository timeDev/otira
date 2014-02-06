part of geometry;

abstract class Shape {
  /// Returns a list of axes to check for collision. See [collide].
  List<Vec2> collisionAxes(Shape other);
  
  /// Returns a (min;max) vector of the projection of this [Shape] onto [axis].
  Vec2 projectOnto(Vec2 axis);
  
  /// The center of this [Shape]
  Vec2 get center;
}