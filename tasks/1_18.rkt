#lang sicp
(#%require rackunit)

(define (double x) (* x 2))
(define (halve  x) (/ x 2))
(define (even?  x) (= (remainder x 2) 0))

(define (fastest-mult b n)
  (define (fastest-mult-iter a b n)
    (cond ((= n 0) a)
	  ((even? n)
	    (fastest-mult-iter (+ a (double b)) (double b) (- (halve n) 1)))
	  (else
	    (fastest-mult-iter (+ a b) (double b) (halve (- n 1))))))
  (fastest-mult-iter 0 b n))

(fastest-mult 8 7)
