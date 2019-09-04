#lang sicp

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
	 (sum term (next a) next b))))

(define (simpson-integral f a b n)
  (define (simpson-sum h)
    (define (simpson-inc2 k) (+ k 2))
    (define (simpson-term k) (f (+ a (* k h))))
    (* (/ h 3) (+ (simpson-term 0)
		  (simpson-term n)
		  (* 2 (sum simpson-term 2 simpson-inc2 (- n 2)))
		  (* 4 (sum simpson-term 1 simpson-inc2 (- n 1))))))
    (simpson-sum (/ (- b a) n)))

(define (cube x) (* x x x))

(simpson-integral cube 0.0 1.0 100)
(simpson-integral cube 0.0 1.0 1000)
