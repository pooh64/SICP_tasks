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

(define (mul-interval x y)
  (make-center-percent (* (center x)
			  (center y))
		       (+ (percent x)
			  (percent y))))

(define (div-interval x y)
  (mul-interval
    x
    (make-interval (/ 1.0 (upper-bound y))
		   (/ 1.0 (lower-bound y)))))


(define i1 (make-center-percent 10.0 1.0))
(define i2 (make-center-percent 2.0  2.0))

; value ~ 1 + sigma(i1)^2
(display-center-percent (div-interval i1 i1))

(display-center-percent (div-interval i1 i2))
