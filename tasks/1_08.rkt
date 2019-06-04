;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname 1_08) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(define (square a) (* a a))
(define (cube a) (* a a a))

(define (croot-improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))

(define (croot-enough? prev cur)
  (< (/ (abs (- prev cur)) cur) 0.01))

(define (croot-check prev cur x)
  (if (croot-enough? prev cur)
      cur
      (croot-iter cur x)))

(define (croot-iter guess x)
  (croot-check guess (croot-improve guess x) x))

(define (my_croot x)
  (croot-iter 1.0 x))

(cube (my_croot 10))