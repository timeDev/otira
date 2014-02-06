part of math;

/// Calculates the dot product of [a] and [b].
double dot4(Vec4 a, Vec4 b) => a.x*b.x + a.y*b.y + a.z*b.z + a.w*b.w;

class Vec4 {
  /// The x component of this [Vec4]
  double x;
  
  /// The y component of this [Vec4]
  double y;
  
  /// The z component of this [Vec4]
  double z;
  
  /// The w component of this [Vec4]
  double w;
  
  /// Creates a new [Vec4].
  Vec4(num x, num y, num z, num w) {
    this.x = x.toDouble();
    this.y = y.toDouble();
    this.z = z.toDouble();
    this.w = w.toDouble();
  }
  
  /// Creates a new [Vec4] pointing to (0;0;0;0).
  Vec4.zero() : this(0, 0, 0, 0);
  
  /// Creates a new [Vec4] pointing to (0;0;0;1).
  Vec4.identity() : this(0, 0, 0, 1);
  
  /// Creates a new [Vec4] pointing to (1;0;0;0).
  Vec4.unitX() : this(1,0,0,0);
  
  /// Creates a new [Vec4] pointing to (0;1;0;0).
  Vec4.unitY() : this(0,1,0,0);
  
  /// Creates a new [Vec4] pointing to (0;0;1;0).
  Vec4.unitZ() : this(0,0,1,0);
  
  /// Creates a new [Vec4] pointing to (0;0;0;1).
  Vec4.unitW() : this(0,0,0,1);
  
  /// Creates a new [Vec4] from the coordinates of [v].
  Vec4.fromVector(Vec4 v) : this(v.x, v.y, v.z, v.w);
  
  /// Returns a human readable form of this [Vec4].
  toString() => '($x;$y;$z,$w)';
  
  /// Returns a JSON-serialized form of this [Vec4].
  serialize() => '{"x":$x,"y":$y,"z":$z,"w":$w}';
  
  /// Returns a copy of this [Vec4].
  Vec4 clone() => new Vec4(x, y, z, w);
  
  /// Copies [x], [y], [z] and [w] from this [Vec4] to [t].
  Vec4 copyTo(Vec4 t) => t.copyFrom(this);
  
  /// Copies [x], [y], [z] and [w] from [t] to this [Vec4].
  Vec4 copyFrom(Vec4 t) => setValues(t.x, t.y, t.z, t.w);
  
  /// Sets the components of this [Vec4] to [x], [y], [z] and [w] and returns this object.
  Vec4 setValues(num x, num y, num z, num w) {
    this.x = x.toDouble();
    this.y = y.toDouble();
    this.z = z.toDouble();
    this.w = w.toDouble();
    return this;
  }
  
  /// Adds each component of this [Vec4] to the corresponding component of [v] and returns the result.
  /// This operation does not change this object.
  Vec4 operator +(Vec4 v) => new Vec4(x + v.x, y + v.y, z + v.z, w + v.w);
  
  /// Subtracts each component of [v] from the corresponding component of this [Vec4] and returns the result.
  /// This operation does not change this object.
  Vec4 operator -(Vec4 v) => new Vec4(x - v.x, y - v.y, z - v.z, w - v.w);
  
  /// Multiplies each component of this [Vec4] with [scale] and returns the result.
  /// This operation does not change this object.
  Vec4 operator *(num scale) => new Vec4(x * scale, y * scale, z * scale, w * scale);
  
  /// Divides each component of this [Vec4] by [scale] and returns the result.
  /// This operation does not change this object.
  Vec4 operator /(num scale) => this * (1.0/scale);
  
  /// Negates this [Vec4] and returns the result.
  /// This operation does not change this object.
  Vec4 operator -() => new Vec4(-x, -y, -z, -w);
  
  /// Multiplies each component of this [Vec4] with the corresponding component of [other] and returns the result.
  /// This operation does not change this object.
  Vec4 multiply(Vec4 other) => new Vec4(x * other.x, y * other.y, z * other.z, w * other.w);
  
  /// Divides each component of this [Vec4] by the corresponding component of [other] and returns the result.
  /// This operation does not change this object.
  Vec4 divide(Vec4 other) => new Vec4(x / other.x, y / other.y, z / other.z, w / other.w);
  
  /// Adds [scalar] to each component and returns the result.
  /// This operation does not change this object.
  Vec4 addScalar(num scalar) => new Vec4(x + scalar, y + scalar, z + scalar, w + scalar);
  
  /// Subtracts [scalar] from each component and returns the result.
  /// This operation does not change this object.
  Vec4 subScalar(num scalar) => new Vec4(x - scalar, y - scalar, z - scalar, w - scalar);
  
  /// Sets the [length] of this [Vec4] to 1.0
  Vec4 normalize() => copyFrom(normalized());
  
  /// Returns a [Vec4] pointing in the same direction with [length] 1.0
  /// This operation does not change this object.
  Vec4 normalized() {
    var l = length;
    if(l == 0)
      return new Vec4.zero();
    l = 1/l;
    return new Vec4(x * l, y * l, z * l, w * l);
  }
  
  /// The length of this [Vec4]
  double get length => sqrt(lengthSq);
  
  /// The square of the [length] of this [Vec4]
  double get lengthSq => x * x + y * y + z * z + w * w;
  
  /// Sets [length] to [l] by normalizing and scaling with [l].
  Vec4 setLength(num l) => copyFrom(withLength(l));

  /// Returns a [Vec4] pointing in the same direction with lenght [l].
  /// This operation does not change this object.
  Vec4 withLength(num l) => normalized() * l;
  
  /// Calculates the distance between this [Vec4] and [other].
  /// This operation does not change this object.
  double distanceTo(Vec4 other) => (this - other).length;
  
  /// Calculates the square of the distance between this [Vec4] and [other].
  /// This operation does not change this object.
  double distanceSq(Vec4 other) => (this - other).lengthSq;
  
  /// Calculates the dot product of this [Vec4] and [other].
  /// This operation does not change this object.
  double dot(Vec4 other) => dot4(this, other);
}