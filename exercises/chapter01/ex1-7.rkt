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
