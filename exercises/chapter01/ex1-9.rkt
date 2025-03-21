#lang sicp
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
