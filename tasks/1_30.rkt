#lang sicp

(define (sum term a next b)
  (define (sum-iter a result)
    (if (> a b)
	result
	(sum-iter (next a) (+ result (term a)))))
  (sum-iter a 0))

(define (equ x) x)
(define (inc x) (+ x 1))

(sum equ 1 inc 3)
