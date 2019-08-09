#lang sicp

(define (cons x y)
  (lambda (m) (m x y)))
(define (car z)
  (z (lambda (p q) p)))
(define (cdr z)
  (z (lambda (p q) q)))


(car (cons 0 1))
(cdr (cons 0 1))
