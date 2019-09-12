#lang sicp

(define (map proc items)
  (if (null? items)
      nil
      (cons (proc (car items))
	    (map proc (cdr items)))))


; S(k, n) - set of all subsets of (Ak, ..., An)
;
; S(k, n) = (all S(k, n) elements without   Ak) &
;	    (all S(k, n) elements including Ak) =
;
; 	  = S  (k + 1, n) &
;	    SAk(k + 1, n)
;
; (SX(k, n) = { Ai : for any Ai from SX exists Bi from S  : Ai & X = Bi
;                 : for any Bi from S  exists Ai from SX : Ai & X = Bi }
;
;   (S(k,n) elements with X))
;
; => S(k, n) = S(k + 1, n) & SAk(k + 1, n)
;
(define (subsets s)
  (if (null? s)
      (list nil)
      (let ((rest (subsets (cdr s))))
	(append rest (map (lambda (set) (cons (car s) set))
			  rest)))))

(define s1 (list 1 2 3))

s1
(subsets s1)
