part of geometry;

/// A polygon. For collision to work, only convex polygons can be tested.
class Polygon extends Shape {
  /// A list of points defining this [Polygon]
  List<Vec2> points;
  
  /// A list of edges defining this [Polygon]
  List<Vec2> edges = new List();
  
  /// Creates a new [Polygon].
  Polygon(this.points) {
    buildEdges();
  }
  
  /// Creates a new [Polygon] from four points.
  Polygon.quad(Vec2 a, Vec2 b, Vec2 c, Vec2 d) : this([a, b, c, d]);
  
  /// (Re)populates the [edges] list.
  void buildEdges() {
    edges.clear();
    Vec2 p1, p2;
    for (int i = 0; i < points.length; i++) {
      p1 = points[i];
      p2 = i+1 >= points.length ? points[0] : points[i+1];
      edges.add(p2-p1);
    }
  }
  
  /// Returns a list of axes to check for collision. See [collide].
  List<Vec2> collisionAxes(Shape other) => edges.map((v) => new Vec2(v.y, v.x));

  /// Returns a (min;max) vector of the projection of this [Shape] onto [axis].
  Vec2 projectOnto(Vec2 axis) {
    var p = points.map((v) => dot2(v, axis));
    return new Vec2(minAll(p), maxAll(p));
  }
  
  /// The center of this [Shape]
  Vec2 get center => new Vec2(average(points.map((p) => p.x)), average(points.map((p) => p.y)));
}