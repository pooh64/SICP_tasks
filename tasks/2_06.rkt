#lang sicp

(define zero (lambda (f) (lambda (x) x)))
(define one  (lambda (f) (lambda (x) (f x))))
(define two  (lambda (f) (lambda (x) (f (f x)))))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

; just express n3 in terms of n1 and n2 on paper
(define (+ n1 n2)
  (lambda (f) (lambda (x) ((n2 f) ((n1 f) x)))))


(define (dummy x)
  (display "x"))

((zero dummy) dummy)

((one dummy) dummy)
(newline)

((two dummy) dummy)
(newline)

(((+ one two) dummy) dummy)
(newline)
