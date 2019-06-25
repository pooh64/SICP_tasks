#lang sicp
(#%require rackunit)

(define (cont-frac-recursive n d k)
  (if (= k 1)
      (/ (n 1) (d 1))
      (/ (n 1) (+ (d 1) (cont-frac-recursive (lambda (i) (n (+ i 1)))
					     (lambda (i) (d (+ i 1)))
					     (- k 1))))))

(define (cont-frac-iterative n d k)
  (define (cont-frac-iter i accum)
    (let ((next-accum (/ (n i) (+ (d i) accum))))
	  (if (= i 1)
	      next-accum
	      (cont-frac-iter (- i 1) next-accum))))
  (cont-frac-iter k 0))

(define cont-frac cont-frac-iterative)

(define (golden-approx k)
  (/ 1 (cont-frac (lambda (i) 1.0)
		  (lambda (i) 1.0)
		  k)))

(define (test-appr appr-func val prec)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) prec))
  (define (test-iter i)
    (let ((appr-val (appr-func i)))
      (if (close-enough? appr-val val)
	  i
	  (test-iter (+ i 1)))))
  (test-iter 1))

(golden-approx 9)
(test-appr golden-approx (/ (+ 1 (sqrt 5)) 2) 0.001)
