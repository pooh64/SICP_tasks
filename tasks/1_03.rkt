#lang sicp
(#%require rackunit)

(define (choose_2 op a b)
  (if (op a b) a b))

(define (square a) (* a a))
(define (sum-square a b) (+ (square a) (square b)))

(define (func a b c)
  (sum-square (choose_2 > a b)
	      (choose_2 > c (choose_2 < a b))))

(func 2 1 6)
