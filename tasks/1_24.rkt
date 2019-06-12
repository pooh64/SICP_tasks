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
  (if (fast-prime? n 128)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
	((fermat-test n) (fast-prime? n (- times 1)))
	(else false)))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
	((even? exp)
	  (remainder (square (expmod base (/ exp 2) m))
		     m))
	(else
	  (remainder (* base (expmod base (- exp 1) m))
		     m))))

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
