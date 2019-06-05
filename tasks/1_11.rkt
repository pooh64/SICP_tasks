#lang sicp
(#%require rackunit)

(define (func n)
  (define (func-iter a b c count)
    (if (= count 0)
        a
        (func-iter b c (+ a b c ) (- count 1))))
  (func-iter 0 1 2 n))

(func 0)
(func 1)
(func 2)
(func 3)
(func 4)
(func 5)
