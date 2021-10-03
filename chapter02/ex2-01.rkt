#lang sicp
;; ex2.1

(define (make-rat n d)
  (let ((g (gcd n d)))
    (cons (/ n g) (/ d g))))