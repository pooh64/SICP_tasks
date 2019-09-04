#lang sicp

(define (average x y)
  (/ (+ x y) 2))

(define (square a) (* a a))

(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (good-enough?2 prev cur)
  (< (/ (abs (- prev cur)) cur) 0.001))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (sqrt-check2 prev cur x)
  (if (good-enough?2 prev cur)
      cur
      (sqrt-iter2 cur x)))

(define (sqrt-iter2 guess x)
  (sqrt-check2 guess (improve guess x) x))

(define (my_sqrt x)
  (sqrt-iter 1.0 x))

(define (my_sqrt2 x)
  (sqrt-iter2 1.0 x))

(square (my_sqrt  0.02))
(square (my_sqrt2 0.02))
