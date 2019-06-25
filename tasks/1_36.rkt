#lang sicp
(#%require rackunit)

(define tolerance 0.01)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (display next)
      (newline)
      (if (close-enough? guess next)
	  next
	  (try next))))
  (try first-guess))

(define (func x) (/ (log 1000) (log x)))
(define (average a b) (/ (+ a b) 2))

(fixed-point func 3.0)
(newline)
(fixed-point (lambda (x) (average (func x) x)) 3.0)
