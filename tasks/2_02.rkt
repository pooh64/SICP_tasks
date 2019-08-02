#lang sicp

(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))

(define (print-point p)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")")
  (newline))

(define (avg x y) (/ (+ x y) 2))

(define (make-segment start end) (cons start end))
(define (start-segment s) (car s))
(define (end-segment s) (cdr s))
(define (midpoint-segment s)
  (make-point (avg (x-point (start-segment s))
		   (x-point (end-segment s)))
	      (avg (y-point (start-segment s))
		   (y-point (end-segment s)))))

(print-point (midpoint-segment (make-segment (make-point 1 4)
					     (make-point 5 0))))
