Contributing to otira
=====================

These are guidelines that anyone who wants to contribute to
this project should apply to their code.

Indentation
-----------

One indent = 2 spaces

General rule: Anything in curly brackets should be indented.

When a statement takes up more than one line, all lines after
the first one should be indented.

New Lines
---------

Start a new line:
* after a class declaration and `{`
* after a function or method declaration and `{`
* after a getter or setter declaration
* after a finished statement
* after an `if´, `else`, `while`, `for`, `do` or `switch` clause
* when a function call has two or more long parameters, after each parameter

Comments
--------

If the meaning a particular statement or group of statements
in a function is not immediately occurent, place a line comment
before that statement.

Documentation
-------------

Every function, class, field, getter, setter, constructor and factory
must be documented within the code.
Follow the dart documentation [guidelines](https://www.dartlang.org/articles/doc-comment-guidelines/).
For documentation comments that are shorter than four lines
use the triple slash notation.

A pull request will not be accepted until all new features it provides
are properly documented.