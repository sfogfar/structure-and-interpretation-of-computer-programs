#lang racket
;; Racket used over SICP Scheme here for
;; access to current-inexact-time function.

(define (square x) (* x x))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (smallest-divisor n) (find-divisor n 2))

(define (divides? a b) (= (remainder b a) 0))

(define (runtime) (current-process-milliseconds))

(define (prime? n) (= n (smallest-divisor n)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))
      "nothing"))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (search-for-primes n) (find-next-prime (+ n 1) 3 0))

(define (find-next-prime n to-find found)
  (cond ((= found to-find) "nothing")
        ((prime? n) ((timed-prime-test n)
                     (find-next-prime (+ n 1) to-find (+ found 1))))
        (else (find-next-prime (+ n 1) to-find found))))