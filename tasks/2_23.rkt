#lang sicp

(define (for-each proc w)
  (cond ((null? w) #t)
	(else (proc (car w))
	      (for-each proc (cdr w)))))


(for-each (lambda (x)
	    (newline)
	    (display x))
	  (list 57 321 88))
