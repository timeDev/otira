part of geometry;

/// The result of a collision test
class CollisionResult {
  /// If the tested shapes collide
  bool collide;
  
  /// If the tested shapes will collide after applying the velocity
  bool willCollide;
  
  /// The Minimum Translation Distance vector
  Vec2 mtd;
  
  /// Creates a new [CollisionResult] instance.
  CollisionResult(this.collide, this.willCollide, this.mtd);
  
  /// Creates a [CollisionResult] indicating no collision.
  CollisionResult.noCollision() : this(false, false, new Vec2.zero());
  
  /// Returns the standard beginning assumption of the SAT algorithm.
  CollisionResult.standard() : this(true, true, new Vec2.zero());
}

/// Tests if [s] and [m] collide or will collide after applying [v] to [m].
CollisionResult collide(Shape s, Shape m, Vec2 v) {
  // Declared inside the function to hide it from the library
  var intervalDistance = (Vec2 a, Vec2 b) => (a.x < b.x) ? b.x - a.y : a.x - b.y;
  
  double minDist = double.INFINITY;
  CollisionResult result = new CollisionResult.standard();
  Vec2 translAxis = new Vec2.zero();
  
  List<Vec2> axes = s.collisionAxes(m);
  axes.addAll(m.collisionAxes(s));
  axes.forEach((a) => a.normalize());
  var i = axes.iterator;
  while(i.moveNext()) {
    var projS = s.projectOnto(i.current); // the returned vals are not vectors
    var projM = m.projectOnto(i.current); // but represent the (min;max) region
    
    double dist = intervalDistance(projS, projM);
    if(dist > 0)
      result.collide = false;
    
    var projV = dot2(v, i.current);
    if(projV < 0)
      projM.x += projV;
    else
      projM.y += projV;
    dist = intervalDistance(projS, projM);
    if(dist > 0)
      result.willCollide = false;
    
    if(!result.collide && !result.willCollide)
      break;
    
    dist = dist.abs();
    if(dist < minDist) {
      minDist =  dist;
      translAxis = dot2(m.center - s.center, i.current) < 0 ? i.current * -1 : i.current;
    }
  }
  if(result.willCollide)
    result.mtd = translAxis * minDist;
  return result;
}

