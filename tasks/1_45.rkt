#lang sicp
(#%require rackunit)

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
	  next
	  (try next))))
  (try first-guess))

(define (average a b) (/ (+ a b) 2))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (repeated f n)
  (define (repeated-iter accum n)
    (if (= n 0)
	accum
	(repeated-iter (lambda (x) (f (accum x))) (- n 1))))
  (repeated-iter f (- n 1)))

(define (n-root-testing x n k)
  (fixed-point ((repeated average-damp k)
		(lambda (y) (/ x (expt y (- n 1)))))
	       1.0))

(define (testing n k)
  (display n)
  (display " ")
  (display k)
  (display " ")
  (n-root-testing (expt 3 n) n k))

(testing 2 1) ; 1
(testing 3 1)
(testing 4 2) ; 2
(testing 5 2)
(testing 6 2)
(testing 7 2)
(testing 8 3) ; 3
(testing 11 3)
(testing 14 3)
(testing 16 4) ; 4
(testing 31 4)
(testing 32 5) ; 5

(define (n-root x n)
  (define (n-damp-iter i val)
    (if (> val n)
	i
	(n-damp-iter (+ i 1) (* val 2))))
  (let ((n-damp (n-damp-iter 1 4)))
    (fixed-point ((repeated average-damp n-damp)
		  (lambda (y) (/ x (expt y (- n 1)))))
		 1.0)))

(n-root (expt 5 12) 12)
