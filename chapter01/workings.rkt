#lang sicp
(define (factorial n)
  (define (fact-iter product counter)
    (if (> counter n)
        product
        (fact-iter (* counter product)
                   (+ counter 1))))
  (fact-iter 1 1))

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1) (A x (- y 1))))))

#|
(define (fib n)
  (define (fib-iter a b count)
    (if (= count 0)
        b
        (fib-iter (+ a b) a (- count 1))))
  (fib-iter 1 0 n))
|#

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

(define (pascal row column)
  (if (or (= row column) (= column 1))
       1
       (+ (pascal (- row 1) (- column 1))
          (pascal (- row 1) column))))

(define (count-change amount) (cc amount 5))
(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else (+ (cc amount
                     (- kinds-of-coins 1))
                 (cc (- amount
                        (first-denomination kinds-of-coins))
                     kinds-of-coins)))))
(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))

(define (square x) (* x x))

(define (even? x) (= (remainder x 2) 0))

(define (fast-expt-rec b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt-rec b (/ n 2))))
        (else (* b (fast-expt-rec b (- n 1))))))

(define (fast-expt b n)
  (define (expt-iter a b n)
    (cond ((= n 0) a)
          ((even? n) (expt-iter a (square b) (/ n 2)))
          (else (expt-iter (* a b) b (- n 1)))))
  (define (square x) (* x x))
  (define (even? x) (= (remainder x 2) 0))
  (expt-iter 1 b n))

#|
(define (* a b)
  (define (halve x) (/ x 2))
  (define (double x) (+ x x))
  (define (even? x) (= (remainder x 2) 0))
  (cond ((= b 0) 0)
        ((even? b) (* (double a) (halve b)))
        (else (+ a (* a (- b 1))))))
|#

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

(define (fib n)
  (fib-iter 1 0 0 1 n))
(define (fib-iter a b p q count)
  (define (even? x) (= (remainder x 2) 0))
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (* p p) (* q q))
                   (+ (* p q) (* q (+ p q)))
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))
