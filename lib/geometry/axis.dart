part of geometry;

class Axis extends Shape {
  Vec2 origin, direction;
  
  Axis(this.origin, this.direction);
  
  List<Vec2> collisionAxes(Shape other) => [new Vec2(-direction.y,direction.x)];

  Vec2 projectOnto(Vec2 axis) {
    var p = dot2(origin, axis);
    if(p == dot2(direction, axis))
      return new Vec2(p, p);
    else
      return new Vec2(-double.INFINITY, double.INFINITY);
  }
  
  Vec2 get center => origin;
}