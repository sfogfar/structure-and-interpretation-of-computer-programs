#lang sicp
;; ex1.11

#|
(define (f n)
  (cond ((< n 3) n)
        (else (+ (f (- n 1))
                 (* 2 (f (- n 2)))
                 (* 3 (f (- n 3)))))))
|#

(define (f n)
  (define (f-iter a b c count)
  (if (= count (- n 3))
      (+ a
         (* 2 b)
         (* 3 c))
      (f-iter (+ a (* 2 b) (* 3 c)) a b (+ count 1))))
  (if (< n 3)
      n
      (f-iter 2 1 0 0)))
