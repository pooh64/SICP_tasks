#lang sicp

(define (double f)
  (lambda (x) (f (f x))))

(define (inc x) (+ x 1))

(((double double) inc) 0)
(((double (double double)) inc) 5)
