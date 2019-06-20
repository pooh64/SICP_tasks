#lang sicp
(#%require rackunit)

(define (accumulate-iterative combiner null-value term a next b)
  (define (accumulate-iter a result)
    (if (> a b)
	result
	(accumulate-iter (next a)
			 (combiner result (term a)))))
  (accumulate-iter a null-value))

(define (accumulate-recursive combiner null-value term a next b)
    (if (> a b)
	null-value
	(combiner (accumulate-recursive combiner null-value term
					(next a) next b)
		  (term a))))

(define (accumulate combiner null-value term a next b)
  (accumulate-iterative combiner null-value term a next b))

(define (product term a next b)
  (accumulate * 1 term a next b))

(define (sum term a next b)
  (accumulate + 0 term a next b))


(define (equ x) x)
(define (inc x) (+ x 1))

(define (fact n)
  (product equ 1 inc n))

(define (pi-series n)
  (define (pi-series-term k)
    (/ (expt -1 k) (+ (* 2 k) 1)))
  (* 4.0 (sum pi-series-term 0 inc n)))

(fact 5)
(pi-series 100)
