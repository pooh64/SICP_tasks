#lang sicp
(#%require rackunit)

(define (filtered-accumulate filter combiner null-value term a next b)
  (define (filtered-accumulate-iter a result)
    (cond ((> a b)
	   result)
	  ((filter a)
	   (filtered-accumulate-iter (next a) (combiner result (term a))))
	  (else
	   (filtered-accumulate-iter (next a) result))))
  (filtered-accumulate-iter a null-value))


(define (prime? n)
  (= n (smallest-divisor n)))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
	((divides? test-divisor n) test-divisor)
	(else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b) (= (remainder b a) 0))
(define (square a) (* a a))

(define (inc a) (+ a 1))
(define (equ a) a)

(define (func1 a b)
  (filtered-accumulate prime? + 0 square a inc b))

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (func2 n)
  (define (func2-filter i)
    (= (gcd n i) 1))
  (filtered-accumulate func2-filter * 1 equ 0 inc n))

(func1 10 15)
(func2 9)
