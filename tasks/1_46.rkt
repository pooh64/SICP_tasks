#lang sicp
(#%require rackunit)

(define (iterative-improve good-enough? improve)
  (lambda (guess)
    (define (iter guess)
      (if (good-enough? guess)
	  guess
	  (iter (improve guess))))
    (iter guess)))

(define (fixed-point f first-guess)
  (define tolerance 0.00001)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  ((iterative-improve (lambda (guess) (close-enough? guess (f guess)))
		     f) first-guess))

(define (average a b) (/ (+ a b) 2))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (repeated f n)
  (define (repeated-iter accum n)
    (if (= n 0)
	accum
	(repeated-iter (lambda (x) (f (accum x))) (- n 1))))
  (repeated-iter f (- n 1)))

(define (n-root x n)
  (define (n-damp-iter i val)
    (if (> val n)
	i
	(n-damp-iter (+ i 1) (* val 2))))
  (let ((n-damp (n-damp-iter 1 4)))
    (fixed-point ((repeated average-damp n-damp)
		  (lambda (y) (/ x (expt y (- n 1)))))
		 1.0)))

(n-root (expt 5 3) 3)


(define (square a) (* a a))

(define (my_sqrt x)
  (define precision 0.0001)
  (define (good-enough? guess x)
    (< (abs (- (square guess) x)) precision))
  (define (improve guess x)
    (average guess (/ x guess)))
  ((iterative-improve (lambda (guess) (good-enough? guess x))
		      (lambda (guess) (improve guess x))) 1.0))

(square (my_sqrt 9))
