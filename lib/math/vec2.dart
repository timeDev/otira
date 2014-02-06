part of math;

/// Calculates the dot product of [a] and [b]
double dot2(Vec2 a, Vec2 b) => a.x * b.x + a.y * b.y;

/// Calculates the cross product of the [a] and [b].
double cross2(Vec2 a, Vec2 b) => a.x * b.y - a.y * b.x;

class Vec2 {
  /// Returns the longer of two vectors.
  static Vec2 longer(Vec2 a, Vec2 b) => a.lengthSq >= b.lengthSq ? a : b;
  
  /// Returns the shorter of two vectors.
  static Vec2 shorter(Vec2 a, Vec2 b) => a.lengthSq <= b.lengthSq ? a : b;
  
  /// The x part of this [Vec2]
  double x;
  /// The y part of this [Vec2]
  double y;
  
  /// Creates a new [Vec2].
  Vec2(num x, num y) {
    this.x = x.toDouble();
    this.y = y.toDouble();
  }
  
  /// Creates a new [Vec2] pointing to (0;0).
  Vec2.zero() : this(0, 0);
  
  /// Creates a new [Vec2] pointing to (1;0).
  Vec2.unitX() : this(1, 0);
  
  /// Creates a new [Vec2] pointing to (0;1).
  Vec2.unitY() : this(0, 1);
  
  /// Creates a new [Vec2] from the coordinates of [t].
  Vec2.fromVector(Vec2 t) : this(t.x, t.y);
  
  /// Returns a human readable form of this [Vec2].
  toString() => '($x;$y)';
  
  /// Returns a JSON-serialized form of this [Vec2].
  serialize() => '{"x":$x, "y":$y}';
  
  /// Returns a copy of this [Vec2].
  Vec2 clone() => new Vec2(x, y);
  
  /// Copies [x] and [y] from this [Vec2] to [t].
  Vec2 copyTo(Vec2 t) => t.copyFrom(this);
  
  /// Copies [x] and [y] from [t] to this [Vec2].
  Vec2 copyFrom(Vec2 t) => setValues(t.x, t.y);
  
  /// Sets the components of this [Vec2] to [x] and [y] and returns this object.
  Vec2 setValues(num x, num y) {
    this.x = x.toDouble();
    this.y = y.toDouble();
    return this;
  }
  
  /// Adds each component of this [Vec2] to the corresponding component of [v] and returns the result.
  /// This operation does not change this object.
  Vec2 operator +(Vec2 v) => new Vec2(x + v.x, y + v.y);
  
  /// Subtracts each component of [v] from the corresponding component of this [Vec2] and returns the result.
  /// This operation does not change this object.
  Vec2 operator -(Vec2 v) => new Vec2(x - v.x, y - v.y);
  
  /// Multiplies each component of this [Vec2] with [scale] and returns the result.
  /// This operation does not change this object.
  Vec2 operator *(num scale) => new Vec2(x * scale, y * scale);
  
  /// Divides each component of this [Vec2] by [scale] and returns the result.
  /// This operation does not change this object.
  Vec2 operator /(num scale) => this * (1/scale); // May be faster than x/s, y/s.
  
  /// Negates this [Vec2] and returns the result.
  /// This operation does not change this object.
  Vec2 operator -() => new Vec2(-x, -y);
  
  /// Multiplies each component of this [Vec2] with the corresponding component of [other] and returns the result.
  /// This operation does not change this object.
  Vec2 multiply(Vec2 other) => new Vec2(x * other.x, y * other.y);
  
  /// Divides each component of this [Vec2] by the corresponding component of [other] and returns the result.
  /// This operation does not change this object.
  Vec2 divide(Vec2 other) => new Vec2(x / other.x, y / other.y);
  
  /// Adds [scalar] to each component and returns the result.
  /// This operation does not change this object.
  Vec2 addScalar(num scalar) => new Vec2(x + scalar, y + scalar);
  
  /// Subtracts [scalar] from each component and returns the result.
  /// This operation does not change this object.
  Vec2 subScalar(num scalar) => new Vec2(x - scalar, y - scalar);
  
  /// Returns a [Vec2] pointing in the same direction with lenght [l].
  /// This operation does not change this object.
  Vec2 withLength(num l) => normalized() * l;
  
  /// Sets [length] to [l] by normalizing and scaling with [l].
  Vec2 setLength(num l) => copyFrom(withLength(l));
  
  /// The length of this [Vec2]
  double get length => sqrt(lengthSq);
  
  /// The square of the [length] of this [Vec2]
  double get lengthSq => x * x + y * y;
  
  /// Sets the [length] of this [Vec2] to 1.0 by dividing each component by [length].
  Vec2 normalize() => copyFrom(normalized());
  
  /// Returns a [Vec2] pointing in the same direction with [length] 1.0.
  /// This operation does not change this object.
  Vec2 normalized() {
    var l = length;
    if(l == 0)
      return new Vec2.zero();
    l = 1/l;
    return new Vec2(x * l, y * l);
  }
  
  /// Calculates the distance between this [Vec2] and [other].
  /// This operation does not change this object.
  double distanceTo(Vec2 other) => (this - other).length;
  
  /// Calculates the square of the distance between this [Vec2] and [other].
  /// This operation does not change this object.
  double distanceSq(Vec2 other) => (this - other).lengthSq;
  
  /// Calculates the dot product of this [Vec2].
  /// 
  /// The dot product of two vectors is defined as
  ///     ax * bx + ay * by
  /// 
  /// This operation does not change this object.
  double dot(Vec2 other) => dot2(this, other);
  
  /// Calculates the cross product of this [Vec2].
  /// 
  /// The cross product of two vectors is defined as
  ///     ax * by - ay * bx
  /// 
  /// This operation does not change this object.
  double cross(Vec2 other) => cross2(this, other);
}