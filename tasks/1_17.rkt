#lang sicp

(define (double x) (* x 2))
(define (halve  x) (/ x 2))
(define (even?  x) (= (remainder x 2) 0))

(define (fast-mult b n)
  (cond ((= n 1) b)
	((even? n) (     fast-mult (double b) (halve n)))
	(else      (+ b (fast-mult (double b) (halve (- n 1)))))))

(fast-mult 7 8)
