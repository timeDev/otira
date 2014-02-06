library math;

import 'dart:math';

part 'math/vec2.dart';
part 'math/vec3.dart';
part 'math/vec4.dart';

/// Returns the smallest number in [nums].
num minAll(Iterable<num> nums) {
  if(nums.isEmpty) return double.NAN;
  num r = nums.first;
  var i = nums.iterator;
  while(i.moveNext())
    r = min(r, i.current);
  return r;
}

/// Returns the greatest number in [nums].
num maxAll(Iterable<num> nums) {
  if(nums.isEmpty) return double.NAN;
  num r = nums.first;
  var i = nums.iterator;
  while(i.moveNext())
    r = max(r, i.current);
  return r;
}

/// Returns the average of [nums].
num average(Iterable<num> nums) => nums.fold(0.0, (a, v) => a + v) / nums.length;

/// Converts the angle [deg] from degrees to radians.
num degToRad(num deg) => PI * deg / 180;

/// Converts the angle [rad] from radians to degrees.
num radToDeg(num rad) => 180 * rad / PI;