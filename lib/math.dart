library math;

import 'dart:math';

part 'math/vector.dart';

num minAll(Iterable<num> nums) {
  if(nums.isEmpty) return double.NAN;
  num r = nums.first;
  var i = nums.iterator;
  while(i.moveNext())
    r = min(r, i.current);
}

num maxAll(Iterable<num> nums) {
  if(nums.isEmpty) return double.NAN;
  num r = nums.first;
  var i = nums.iterator;
  while(i.moveNext())
    r = max(r, i.current);
}

num average(Iterable<num> nums) => nums.fold(0.0, (a, v) => a + v) / nums.length;

num degToRad(num deg) => PI * deg / 180;

num radToDeg(num rad) => 180 * rad / PI;