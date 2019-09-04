#lang sicp

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (define (repeated-iter accum n)
    (if (= n 0)
	accum
	(repeated-iter (lambda (x) (f (accum x))) (- n 1))))
  (repeated-iter f (- n 1)))

(define (average3 a b c) (/ (+ a b c) 3))

(define (smooth f dx)
  (lambda (x) (average3 (f (- x dx))
			(f x)
			(f (+ x dx)))))

(define (n-fold-smooth f dx n)
  (repeated (lambda (g) (smooth g dx)) n))
