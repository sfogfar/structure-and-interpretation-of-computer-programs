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

;; ex1.6
#|
Alyssa will be caught in an infinite loop until she reaches a stack overflow.
This is because she is no longer using the special form of if
and as such must evaluate every parameter. As her second parameter (sqrt-iter)
is recursive, this creates a loop.
|#

;; ex1.7
#|
For very small numbers, the tolerance of 0.001 will not give an appropiate
level of precision as we will terminate guessing too early.
An ezample of a number that is too small is 0.0001,
which has a square root of 0.01, but for which our program will return 0.32...
For very large numbers, we will make too many guesses and it will be too slow.
An example of a number that is too large is 10000000000000.

A better sqrt implementation is below, making full use of the computers
capacity for precision by guessing until the guess can be improved no more.
With this implementation I can't see any particular discrepancy between
the performance for large or small numbers.
|#
(define (sqrt x)
  (define (good-enough? guess)
    (= guess (improve guess)))
  (define (improve guess) (average guess (/ x guess)))
  (define (sqrt-iter guess)
    (if (good-enough? guess)
        guess
        (sqrt-iter (improve guess))))
  (define (average x y)
    (/ (+ x y) 2))
  (sqrt-iter 1.0))

;; ex1.8
(define (cubert x)
  (define (good-enough? guess)
    (= guess (improve guess)))
  (define (improve guess)
    (/ (+ (/ x (square guess)) (* 2 guess)) 3))
  (define (cubert-iter guess)
    (if (good-enough? guess)
      guess
      (cubert-iter (improve guess))))
  (define (square x) (* x x))
  (cubert-iter 1.0))
