#lang sicp
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