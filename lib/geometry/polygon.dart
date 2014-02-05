part of geometry;

class Polygon extends Shape {
  List<Vec2> points;
  List<Vec2> edges = new List();
  
  Polygon(this.points) {
    buildEdges();
  }
  
  Polygon.quad(Vec2 a, Vec2 b, Vec2 c, Vec2 d) : this([a, b, c, d]);
  
  void buildEdges() {
    edges.clear();
    Vec2 p1, p2;
    for (int i = 0; i < points.length; i++) {
      p1 = points[i];
      p2 = i+1 >= points.length ? points[0] : points[i+1];
      edges.add(p2-p1);
    }
  }
  
  List<Vec2> collisionAxes(Shape other) => edges.map((v) => new Vec2(v.y, v.x));

  Vec2 projectOnto(Vec2 axis) {
    var p = points.map((v) => dot2(v, axis));
    return new Vec2(minAll(p), maxAll(p));
  }
  
  Vec2 get center => new Vec2(average(points.map((p) => p.x)), average(points.map((p) => p.y)));
}