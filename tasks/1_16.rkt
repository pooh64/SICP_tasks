#lang sicp
(#%require rackunit)

(define (even? a) (= (remainder a 2) 0))

(define (fast-expt b n)
  (define (fast-expt-iter a b n)
    (cond ((= n 0) a)
	  ((even? n) (fast-expt-iter (* a b b)
				     (* b b)
				     (- (/ n 2) 1)))
	  (else      (fast-expt-iter (* a b)
				     (* b b)
				     (/ (- n 1) 2)))))
  (fast-expt-iter 1 b n))

(fast-expt 4 3)
