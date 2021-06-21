#lang sicp
;; ex1.4

#|
When evaluated, the if expression will first evaluate the predicate b > 0.
Should this be true it will yield the symbol +.
Alternatively it will yield the symbol -.
This symbol becomes the operator of the next expression to be evaluated, +/- a b.
As such, if b is positive we will evaluate a + b,
whereas if b is negative we will evaluate a - b,
thus effectively making an absolute number of b.
|#
