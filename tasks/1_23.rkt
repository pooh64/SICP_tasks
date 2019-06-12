#lang sicp
(#%require rackunit)

(define (search-for-primes low high)
  (timed-prime-test low)
  (if (< low high)
      (search-for-primes (+ low 1) high)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
	((divides? test-divisor n) test-divisor)
	(else (find-divisor n (next test-divisor)))))

(define (next n)
  (if (= n 2)
      3
      (+ n 2)))

(define (divides? a b)
  (= (remainder b a) 0))

(define (square a)
  (* a a))


(search-for-primes 1000    1019)
(newline)
(search-for-primes 10000   10037)
(newline)
(search-for-primes 100000  100043)
(newline)
(search-for-primes 1000000 1000037)

(newline)
