#lang sicp
;; ex1.1
#|
10
12
8
3
6
19
4
16
6
16
|#

;; ex1.2
(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5)))))
   (* 3 (- 6 2) (- 2 7)))

;; ex1.3
(define (sum-of-two-largest-squares a b c)
  (define (square x) (* x x))
  (define (sum-of-squares x y) (+ (square x) (square y)))
  (cond ((and (>= (+ a b) (+ a c)) (>= (+ a b) (+ b c)) (sum-of-squares a b)))
        ((and (>= (+ a c) (+ a b)) (>= (+ a c) (+ b c)) (sum-of-squares a c)))
        (else (sum-of-squares b c))))

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

;; ex1.5
#|
normal-order evaluation: fully expand and then reduce
applicative-order evaluation: evaluate the arguments and then apply
a. With an applicative-order interpreter Ben will be stuck in a loop trying to evaluate y.
b. With a normal-order interpreter Ben will get 0 as a result,
as the predicate x = 0 evaluates true before we need to evaluate argument y.
|#
