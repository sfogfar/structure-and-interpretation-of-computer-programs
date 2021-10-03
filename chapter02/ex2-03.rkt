#lang sicp
;;ex 2.3

(define (make-rectangle x y) (cons x y))
(define (a-edge n) (

(define (make-segment x y) (cons x y))
(define (start-segment n) (car n))
(define (end-segment n) (cdr n))

(define (make-point x y) (cons x y))
(define (x-point n) (car n))
(define (y-point n) (cdr n))

(define (midpoint-segment n)          
  (make-point
   (/ (+ (x-point (start-segment n)) (x-point (end-segment n))) 2)
   (/ (+ (y-point (start-segment n)) (y-point (end-segment n))) 2)))

(define (perimeter n)
  (+ (

;; TODO helper function for averaging points

(define (print-point p)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define a (make-point 0 10))
(define b (make-point 10 10))
(define c (make-point 10 0))
(define d (make-point 0 0))
(define ab (make-segment a b))
(define cd (make-segment c d))
(define abcd (make-rectangle ab cd))