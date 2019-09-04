#lang sicp

(define (cont-frac-iterative n d k)
  (define (cont-frac-iter i accum)
    (let ((next-accum (/ (n i) (+ (d i) accum))))
	  (if (= i 1)
	      next-accum
	      (cont-frac-iter (- i 1) next-accum))))
  (cont-frac-iter k 0))

(define cont-frac cont-frac-iterative)

(define (tan-cf x k)
  (/ (cont-frac (lambda (i) (- (* x x)))
		(lambda (i) (- (* 2 i) 1))
		k)
     (- x)))

(tan-cf (/ 3.1416 4) 10)
