#lang sicp
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
