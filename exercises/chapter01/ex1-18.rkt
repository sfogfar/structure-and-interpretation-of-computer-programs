;; ex1.18

(define (* a b)
  (define (halve x) (/ x 2))
  (define (double x) (+ x x))
  (define (even? x) (= (remainder x 2) 0))

  (define (*-iter i a b)
    (cond ((= b 0) 0)
          ((= b 1) (+ i a))
          ((even? b) (*-iter i (double a) (halve b)))
          (else (*-iter (+ i a) a (- b 1)))))
  (*-iter 0 a b))
