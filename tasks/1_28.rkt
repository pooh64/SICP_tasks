#lang sicp

(define (timed-prime-test n)
  (display n)
  (start-prime-test n (runtime))
  (newline))

(define (start-prime-test n start-time)
  (if (fast-prime? n 1024)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (fast-prime? n times)
  (cond ((= times 0) true)
	((MR-fermat-test n) (fast-prime? n (- times 1)))
	(else false)))

(define (MR-fermat-test n)
  (define (try-it a)
    (= (MR-expmod a (- n 1) n) 1))
  (try-it (+ 1 (random (- n 1)))))

(define (MR-expmod base exp m)
  (define (MR-expmod-test val mod)
    (if (and (= mod 1)
	     (not (or (= val 1)
		      (= val (- m 1)))))
	0
	mod))
  (define (MR-expmod-result val)
    (MR-expmod-test val (remainder (square val)
				   m)))
  (cond ((= exp 0) 1)
	((even? exp)
	  (MR-expmod-result (MR-expmod base (/ exp 2) m)))
	(else
	  (remainder (* base (MR-expmod base (- exp 1) m))
		     m))))

(define (square a)
  (* a a))

(timed-prime-test 99)
(timed-prime-test 49)
(timed-prime-test 19999)
(timed-prime-test 11)
(timed-prime-test 17)
(timed-prime-test 337)
(timed-prime-test 569)
(newline)
(timed-prime-test 561 )
(timed-prime-test 1105)
(timed-prime-test 1729)
(timed-prime-test 2465)
(timed-prime-test 2821)
(timed-prime-test 6601)
