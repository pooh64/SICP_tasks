;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname 1_03) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(define (choose_2 op a b)
  (if (op a b) a b))

(define (square a) (* a a))

(define (func a b c)
  (+ (square (choose_2 > a b))
     (square (choose_2 > c (choose_2 < a b)))))

(func 2 1 6)
