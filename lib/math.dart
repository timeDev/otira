library math;

import 'dart:math';

part 'math/vec2.dart';
part 'math/vec3.dart';
part 'math/vec4.dart';

num minAll(Iterable<num> nums) {
  if(nums.isEmpty) return double.NAN;
  num r = nums.first;
  var i = nums.iterator;
  while(i.moveNext())
    r = min(r, i.current);
  return r;
}

num maxAll(Iterable<num> nums) {
  if(nums.isEmpty) return double.NAN;
  num r = nums.first;
  var i = nums.iterator;
  while(i.moveNext())
    r = max(r, i.current);
  return r;
}

num average(Iterable<num> nums) => nums.fold(0.0, (a, v) => a + v) / nums.length;

num degToRad(num deg) => PI * deg / 180;

num radToDeg(num rad) => 180 * rad / PI;