;; ex1.3

(define (sum-of-two-largest-squares a b c)
  (define (square x) (* x x))
  (define (sum-of-squares x y) (+ (square x) (square y)))
  (cond ((and (>= (+ a b) (+ a c)) (>= (+ a b) (+ b c)) (sum-of-squares a b)))
        ((and (>= (+ a c) (+ a b)) (>= (+ a c) (+ b c)) (sum-of-squares a c)))
        (else (sum-of-squares b c))))
