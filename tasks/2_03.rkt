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

(define (make-rectangle ul br) (cons ul br))
(define (ul-rectangle r) (car r))
(define (br-rectangle r) (cdr r))

(define (h-rectangle r) (- (y-point (ul-rectangle r))
			   (y-point (br-rectangle r))))

(define (w-rectangle r) (- (x-point (br-rectangle r))
			   (x-point (ul-rectangle r))))

(define (perim-rectangle r) (* 2 (+ (h-rectangle r) (w-rectangle r))))

(define (area-rectangle r) (* (h-rectangle r) (w-rectangle r)))


(define test-rect (make-rectangle (make-point 1 5)
				  (make-point 6 2)))

(perim-rectangle test-rect)
(area-rectangle test-rect)
