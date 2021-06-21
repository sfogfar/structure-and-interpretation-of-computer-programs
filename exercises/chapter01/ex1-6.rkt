;; ex1.6

#|
Alyssa will be caught in an infinite loop until she reaches a stack overflow.
This is because she is no longer using the special form of if
and as such must evaluate every parameter. As her second parameter (sqrt-iter)
is recursive, this creates a loop.
|#
