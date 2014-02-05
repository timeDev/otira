part of geometry;

class Ray extends Shape {
  
  Vec2 origin, direction;
  
  Ray(this.origin, this.direction);
  
  List<Vec2> collisionAxes(Shape other) => [new Vec2(-direction.y,direction.x)];

  Vec2 projectOnto(Vec2 axis) {
    var p1 = dot2(origin, axis);
    var p2 = dot2(direction, axis);
    if(p1 == p2)
      return new Vec2(p1, p2);
    else
      return p2 < p1 ? new Vec2(-double.INFINITY, p1) : new Vec2(p1, double.INFINITY);
  }
  
  Vec2 get center => origin;
}