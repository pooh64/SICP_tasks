#lang sicp

(define (cons a b)
  (* (expt 2 a) (expt 3 b)))
(define (car z)
  (decompose z 2))
(define (cdr z)
  (decompose z 3))

(define (square x) (* x x))

; ugly but fast
(define (decompose val denom)
  (define (decompose-iter val denom pow acc)
      (cond ((and (not (< val denom)) (= (remainder val denom) 0))
	     (decompose-iter (/ val denom)
			     (square denom)
			     (* pow 2)
			     (+ acc pow)))
	    ((= pow 1) acc)
	    (else (decompose-iter val
				  (sqrt denom)
				  (/ pow 2)
				  acc))))
  (decompose-iter val denom 1 0))


(car (cons 21 8))
(cdr (cons 17 12))
