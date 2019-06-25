#lang sicp
(#%require rackunit)

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (define (repeated-iter accum n)
    (if (= n 0)
	accum
	(repeated-iter (lambda (x) (f (accum x))) (- n 1))))
  (repeated-iter f (- n 1)))

(define (square x) (* x x))

((repeated square 2) 5)
