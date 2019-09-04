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

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
	(p2 (* (lower-bound x) (upper-bound y)))
	(p3 (* (upper-bound x) (lower-bound y)))
	(p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
		   (max p1 p2 p3 p4))))

(define (spans-nul? x)
  (and (or (> (upper-bound x) 0)
	   (= (upper-bound x) 0))
       (or (< (lower-bound x) 0)
	   (= (lower-bound x) 0))))

(define (div-interval x y)
  (mul-interval
    x
    (if (spans-nul? y)
	(error "div-interval: interval spans 0")
	(make-interval (/ 1.0 (upper-bound y))
		       (/ 1.0 (lower-bound y))))))


(define i1 (make-interval  3 5))
(define i2 (make-interval -1 1))

(display-interval (div-interval i1 i2))
