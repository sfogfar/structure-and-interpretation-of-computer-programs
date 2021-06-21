#lang sicp
;; ex1.17

(define (* a b)
  (define (halve x) (/ x 2))
  (define (double x) (+ x x))
  (define (even? x) (= (remainder x 2) 0))
  (cond ((= b 0) 0)
        ((even? b) (* (double a) (halve b)))
        (else (+ a (* a (- b 1))))))
