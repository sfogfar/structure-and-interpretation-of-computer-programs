;; ex1.5

#|
normal-order evaluation: fully expand and then reduce
applicative-order evaluation: evaluate the arguments and then apply

a. With an applicative-order interpreter Ben will be stuck in a loop trying to evaluate y.
b. With a normal-order interpreter Ben will get 0 as a result,
as the predicate x = 0 evaluates true before we need to evaluate argument y.
|#
