part of math;

/// Calculates the dot product of [a] and [b].
double dot3(Vec3 a, Vec3 b) => a.x*b.x + a.y*b.y + a.z*b.z;

/// Calculates the cross product of [a] and [b].
Vec3 cross3(Vec3 a, Vec3 b) => new Vec3(a.y * b.z - a.z * b.y, a.z * b.x - a.x * b.z, a.x * b.y - a.y * b.x);

class Vec3 {
  /// The x component of this [Vec3]
  double x;
  
  /// The y component of this [Vec3]
  double y;
  
  /// The z component of this [Vec3]
  double z;
  
  /// Creates a new [Vec3].
  Vec3(num x, num y, num z) {
    this.x = x.toDouble();
    this.y = y.toDouble();
    this.z = z.toDouble();
  }
  
  /// Creates a new [Vec3] pointing to (0;0;0).
  Vec3.zero() : this(0, 0, 0);
  
  /// Creates a new [Vec3] pointing to (1;0;0).
  Vec3.unitX() : this(1,0,0);
  
  /// Creates a new [Vec3] pointing to (0;1;0).
  Vec3.unitY() : this(0,1,0);
  
  /// Creates a new [Vec3] pointing to (0;0;1).
  Vec3.unitZ() : this(0,0,1);
  
  /// Creates a new [Vec3] from the coordinates of [v].
  Vec3.fromVector(Vec3 v) : this(v.x, v.y, v.z);
  
  /// Returns a human readable form of this [Vec3].
  toString() => '($x;$y;$z)';
  
  /// Returns a JSON-serialized form of this [Vec3].
  serialize() => '{"x":$x,"y":$y,"z":$z}';
  
  /// Returns a copy of this [Vec3].
  Vec3 clone() => new Vec3(x, y, z);
  
  /// Copies [x], [y] and [z] from this [Vec3] to [t].
  Vec3 copyTo(Vec3 t) => t.copyFrom(this);
  
  /// Copies [x], [y] and [z] from [t] to this [Vec3].
  Vec3 copyFrom(Vec3 t) => setValues(t.x, t.y, t.z);
  
  /// Sets the components of this [Vec3] to [x], [y] and [z] and returns this object.
  Vec3 setValues(num x, num y, num z) {
    this.x = x.toDouble();
    this.y = y.toDouble();
    this.z = z.toDouble();
    return this;
  }
  
  /// Adds each component of this [Vec3] to the corresponding component of [v] and returns the result.
  /// This operation does not change this object.
  Vec3 operator +(Vec3 v) => new Vec3(x + v.x, y + v.y, z + v.z);
  
  /// Subtracts each component of [v] from the corresponding component of this [Vec3] and returns the result.
  /// This operation does not change this object.
  Vec3 operator -(Vec3 v) => new Vec3(x - v.x, y - v.y, z - v.z);
  
  /// Multiplies each component of this [Vec3] with [scale] and returns the result.
  /// This operation does not change this object.
  Vec3 operator *(num scale) => new Vec3(x * scale, y * scale, z * scale);
  
  /// Divides each component of this [Vec3] by [scale] and returns the result.
  /// This operation does not change this object.
  Vec3 operator /(num scale) => this * (1.0/scale);
  
  /// Negates this [Vec3] and returns the result.
  /// This operation does not change this object.
  Vec3 operator -() => new Vec3(-x, -y, -z);
  
  /// Multiplies each component of this [Vec3] with the corresponding component of [other] and returns the result.
  /// This operation does not change this object.
  Vec3 multiply(Vec3 other) => new Vec3(x * other.x, y * other.y, z * other.z);
  
  /// Divides each component of this [Vec3] by the corresponding component of [other] and returns the result.
  /// This operation does not change this object.
  Vec3 divide(Vec3 other) => new Vec3(x / other.x, y / other.y, z / other.z);
  
  /// Adds [scalar] to each component and returns the result.
  /// This operation does not change this object.
  Vec3 addScalar(num scalar) => new Vec3(x + scalar, y + scalar, z + scalar);
  
  /// Subtracts [scalar] from each component and returns the result.
  /// This operation does not change this object.
  Vec3 subScalar(num scalar) => new Vec3(x - scalar, y - scalar, z - scalar);
  
  /// Sets the [length] of this [Vec3] to 1.0
  Vec3 normalize() => copyFrom(normalized());
  
  /// Returns a [Vec3] pointing in the same direction with [length] 1.0
  /// This operation does not change this object.
  Vec3 normalized() {
    var l = length;
    if(l == 0)
      return new Vec3.zero();
    l = 1/l;
    return new Vec3(x * l, y * l, z * l);
  }
  
  /// The length of this [Vec3]
  double get length => sqrt(lengthSq);
  
  /// The square of the [length] of this [Vec3]
  double get lengthSq => x * x + y * y + z * z;
  
  /// Sets [length] to [l] by normalizing and scaling with [l].
  Vec3 setLength(num l) => copyFrom(withLength(l));

  /// Returns a [Vec2] pointing in the same direction with lenght [l].
  /// This operation does not change this object.
  Vec3 withLength(num l) => normalized() * l;
  
  /// Calculates the distance between this [Vec2] and [other].
  /// This operation does not change this object.
  double distanceTo(Vec3 other) => (this - other).length;
  
  /// Calculates the square of the distance between this [Vec2] and [other].
  /// This operation does not change this object.
  double distanceSq(Vec3 other) => (this - other).lengthSq;
  
  /// Calculates the dot product of this [Vec3] and [other].
  /// This operation does not change this object.
  double dot(Vec3 other) => dot3(this, other);
  
  /// Calculates the cross product of this [Vec3] and [other].
  /// This operation does not change this object.
  Vec3 cross(Vec3 other) => cross3(this, other);
}