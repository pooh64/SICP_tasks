#lang sicp

(define (make-interval a b) (cons a b))
(define (lower-bound i) (car i))
(define (upper-bound i) (cdr i))
(define (width i) (- (upper-bound i) (lower-bound i)))

(define (display-interval i)
  (display "(")
  (display (lower-bound i))
  (display ",")
  (display (upper-bound i))
  (display ")")
  (newline))

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
		 (- (upper-bound x) (lower-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
	(p2 (* (lower-bound x) (upper-bound y)))
	(p3 (* (upper-bound x) (lower-bound y)))
	(p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
		   (max p1 p2 p3 p4))))


(define i1 (make-interval 3 5))
(define i2 (make-interval 1 2))
(define i3 (make-interval 2 3))

; equal values
(width (sub-interval i1 i2))
(+ (width i1) (width i2))

(newline)

; let z = width(mul-interval(x, y)) = f(width(x), width(y))
; 	w2 = width(i2) and w3 = width(i3) are equal, but
; 	f(i1, i2) != f(i1, i3) =>
;		there are no functional dependence between z and (x, y).
(width i2)
(width i3)

(width (mul-interval i1 i2))
(width (mul-interval i1 i3))
