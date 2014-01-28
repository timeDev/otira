Collision
=========

This document describes collision detection using the seperating axis theorem (SAT)
Using the SAT we can collide all convex polygons as well as circles (due to the implementation).

Predicate
---------

According to the SAT, two polygons do not collide if an axis can exist that seperates them.
This can be simplified, so that we only have to test the perpendicular of each side of
each polygon.

Setup
-----

For every iteration, we first calculate the perpendicular to one of the sides.
_x_ = (-_ay_;_ax_)
For a circle, we only require those side normals, that go through one of the
other polygon's corners.
This is the axis to test in this iteration.

Collision test
--------------

Now, both polygons needs to be projected onto the calculated axis.
This produces two one-dimensional line segments (regions).
If the regions overlap, continue with the next iteration.
If the regions are completely seperate, the polygons do not collide,
so we return.

Polygon projection
------------------

Project each point of the polygon onto the axis.
The region then goes from the min value to the max value.
p = (_v_ dot _a_) / _||a||_
By normalizing the axis, we get:
p = _v_ dot _a_