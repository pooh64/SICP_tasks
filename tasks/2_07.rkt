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

(display-interval (make-interval 1 2))
