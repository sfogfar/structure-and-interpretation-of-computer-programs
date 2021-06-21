#lang sicp
;; TODO
;; Finish 1.10
;; Attempt 1.13
;; Draw out 1.14 tree
;; Get to grips with p' q' in 1.19

;; ex1.9
#|
The first procedure generates a linearly recursive process.
The second procedure generates an iterative process.
Although the procedure is recursive the state of the process is captured entirely by
two variables, and these alone could be used to track and execute the process.
|#

#|
(define (+ a b)
  (if (= a 0) b (inc (+ (dec a) b))))

(+ 3 2)
(inc (+ (dec 3) 2))
(inc (+ 2 2))
(inc (inc (+ (dec 2) 2)))
(inc (inc ( + 1 2)))
(inc (inc (inc (+ (dec 1) 2))))
(inc (inc (inc (+ 0 2))))
(inc (inc (inc 2)))
(inc (inc 3))
(inc 4)
5
|#

#|
(define (+ a b)
  (if (= a 0) b (+ (dec a) (inc b))))

(+ 3 2)
(+ (dec 3) (inc 2))
(+ 2 3)
(+ (dec 2) (inc 3))
(+ 1 4)
(+ (dec 1) (inc 4))
(+ 0 5)
5
|#

;; ex1.10
#|
(A 1 10) evaluates to 1024
(A 2 4) evaluates to 65536
(A 3 3) evaluates to 65536
|#

#|
(f n) computes 2n
|#

;; ex1.11
#|
(define (f n)
  (cond ((< n 3) n)
        (else (+ (f (- n 1))
                 (* 2 (f (- n 2)))
                 (* 3 (f (- n 3)))))))
|#

#|
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
|#

;; ex1.12
#|
(define (pascal row column)
  (if (or (= row column) (= column 1))
       1
       (+ (pascal (- row 1) (- column 1))
          (pascal (- row 1) column))))
|#

;; ex1.15
#|
Procedure p will be applied 5 times.
The order of growth will be O(log(a))
|#

;; ex1.16
#|
(define (fast-expt b n)
  (define (expt-iter a b n)
    (cond ((= n 0) a)
          ((even? n) (expt-iter a (square b) (/ n 2)))
          (else (expt-iter (* a b) b (- n 1)))))
  (define (square x) (* x x))
  (define (even? x) (= (remainder x 2) 0))
  (expt-iter 1 b n))
|#

;; ex1.17
#|
(define (* a b)
  (define (halve x) (/ x 2))
  (define (double x) (+ x x))
  (define (even? x) (= (remainder x 2) 0))
  (cond ((= b 0) 0)
        ((even? b) (* (double a) (halve b)))
        (else (+ a (* a (- b 1))))))
|#

;; ex1.18
#|
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
|#