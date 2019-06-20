#lang sicp
(#%require rackunit)

(define (func-recursive n)
  (if (< n 3)
      n
      (+ (     func-recursive (- n 1))
	 (* 2 (func-recursive (- n 2)))
	 (* 3 (func-recursive (- n 3))))))

(define (func-iterative n)
  (define (func-iter a b c count)
    (if (= count 0)
        c
        (func-iter b
		   c
		   (+ c (* 2 b) (* 3 a)) (- count 1))))
  (if (< n 3)
      n
      (func-iter 1 2 4 (- n 3))))

(func-recursive 10)
(func-iterative 10)
