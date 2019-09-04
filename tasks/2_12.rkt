#lang sicp

(define (make-interval a b) (cons a b))
(define (lower-bound intrv) (car intrv))
(define (upper-bound intrv) (cdr intrv))

(define (make-center-percent c p)
  (let ((ratio (/ p 100)))
	(make-interval (* c (- 1 ratio))
		       (* c (+ 1 ratio)))))

(define (display-center-percent x)
  (display "(")
  (display (center x))
  (display ",")
  (display (percent x))
  (display "%)")
  (newline))

(define (display-interval x)
  (display "(")
  (display (lower-bound x))
  (display ",")
  (display (upper-bound x))
  (display ")")
  (newline))

(define (center x)
  (/ (+ (lower-bound x)
	(upper-bound x))
     2))

(define (percent x)
  (* (/ (- (upper-bound x)
	   (lower-bound x))
	(center x))
     50))


(define i1 (make-center-percent 10.0 1.0))

(display-center-percent i1)
(display-interval i1)
