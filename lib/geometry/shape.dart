part of geometry;

abstract class Shape {
  List<Vec2> collisionAxes(Shape other);
  Vec2 projectOnto(Vec2 axis);
  Vec2 get center;
}