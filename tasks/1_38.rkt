#lang sicp
(#%require rackunit)

(define (cont-frac-iterative n d k)
  (define (cont-frac-iter i accum)
    (let ((next-accum (/ (n i) (+ (d i) accum))))
	  (if (= i 1)
	      next-accum
	      (cont-frac-iter (- i 1) next-accum))))
  (cont-frac-iter k 0))

(define cont-frac cont-frac-iterative)

(define (approx-e i)
  (+ 2 (cont-frac (lambda (i) 1.0)
		  (lambda (i) (if (= (remainder (+ i 1) 3) 0)
				  (expt 2 (/ (+ i 1) 3))
				  1))
		  i)))

(approx-e 10)
