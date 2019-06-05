#lang sicp
(#%require rackunit)

(define (pascal x y)
  (cond ((= y 1) 1)
	((= y x) 1)
	(else (+ (pascal (- x 1) (- y 1)) (pascal (- x 1) y)))))

(define (comb n k) (pascal (+ n 1) (+ k 1)))

(comb 4 2)
