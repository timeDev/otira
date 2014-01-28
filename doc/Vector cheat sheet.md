Vectors
=======

A vector is kind of an arrow pointing to a position. The length and direction
are also important though.
Otira currently only has 2-dimensional vectors (Vec2 class). These have an
x and y component.

Representation
--------------

A vector is represented in a format like this: (x;y) or (x|y).
This is in kartesian coordinates, that means x and y are axes.
Since we're programming we can also use NaN and Infinity.

Examples: (1.0;1.0), (-6.0|2.5), (NaN;-Infinity)

When referring to a vector, we usually use lowercase letters,
sometimes bold or italic.

In this document we use italic lowercase letters for vectors, regular lowercase
letters for regular numbers and *vx* or *vy* to refer to the compontents
x and y of the vector *v*.

Basic Math
----------

Like with regular numbers (called scalars) we can do math with
vectors. Here are the rules:
* *a* + *b* = (*ax* + *bx*;*ay* + *by*)
* *a* - *b* = (*ax* - *bx*;*ay* - *by*)
* *a* * *b* = (*ax* \* *bx*;*ay* \* *by*)
* *a* / *b* = (*ax* / *bx*;*ay* / *by*)

We can also use a scalar for b:
* *a* + b = (*ax* + b;*ay* + b)
* etc.

This is called scalar addition/subtraction and for multiplication
and division simply scaling.

Equality
--------

Two vectors are equal, if their direction and length are equal.
This is also the case, if their components are equal.

Length
------

The length (or magnitude or norm) of a vector *v* (written *||v||*) is equal to the square root of
the sum of squares of all components: *||v||* = sqrt(*vx* \* *vx* + *vy* \* *vy)

When comparing the length it is always faster to compare the square of the length.

Zero vector
-----------

A zero vector is a vector where x, y and thus the length are 0.

Unit vector
-----------

A unit vector is a vector with length = 1.

Normalization
-------------

Normalizing a vector means diving every component of the vector by its length.
This results in a unit vector.

Dot product
-----------

The dot product (or scalar product) of two vectors *a* and *b*, written as *a* dot *b* is
defined like this: *a* dot *b* = *ax* \* *bx* + *ay* \* *by*

This also happens to be equal to 
_||a||_ \* *||b||* \* cos theta
where theta is the angle between the two vectors.
This means that we can calculate theta like this:
theta = acos(*a* dot *b* / *||a||* \* *||b||*)

So if *a* and *b* are orhtogonal, then theta is 90° and *a* dot *b* = 0

Also, if *a* and *b* are codirectional, then theta is 0° and *a* dot *b* = *||a||* \* *||b||*

The dot product is
1. Commutative: *a* dot *b* = *b* dot *a*
2. Distributive: *a* dot (*b* + *c*) = *a* dot *b* + *a* dot *c*


Cross product
-------------

The cross product (or vector product) of two 2-dimensional vectors *a* and *b*, written as *a* cross *b*
or more commonly *a* x *b* is defined like this: *a* x *b* = *ax* \* *by* - *ay* \* *by*

