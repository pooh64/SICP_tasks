#lang sicp
(#%require rackunit)

(define (product term a next b)
  (define (product-iter a result)
    (if (> a b)
	result
	(product-iter (next a) (* result (term a)))))
  (product-iter a 1))

(define (equ x) x)
(define (inc  x) (+ x 1))
(define (inc2 x) (+ x 2))

(define (fact n)
  (product equ 1 inc n))

(define (wallis-product n)
  (define (wallis-product-term i)
    (+ 1
       (/ 1.0 (- (* i i) 1))))
  (* 2 (product wallis-product-term 2 inc2 (* 2 n))))

(fact 5)
(wallis-product 100)
