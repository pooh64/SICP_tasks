#lang sicp

(define (make-interval a b) (cons a b))
(define (lower-bound intrv) (car intrv))
(define (upper-bound intrv) (cdr intrv))

(define (display-interval intrv)
  (display "(")
  (display (lower-bound intrv))
  (display ",")
  (display (upper-bound intrv))
  (display ")")
  (newline))

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
		 (- (upper-bound x) (lower-bound y))))

(display-interval (sub-interval (make-interval 3 5)
				(make-interval 1 2)))
