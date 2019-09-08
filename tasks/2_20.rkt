#lang sicp

(define (same-parity x . w)
  (let ((args (cons x w)))
    (define (same-collect pred w)
      (if (null? w)
	  nil
	  (if (pred (car w))
	      (cons (car w) (same-collect pred (cdr w)))
	      (same-collect pred (cdr w)))))
    (if (even? x)
	(same-collect even? args)
	(same-collect odd?  args))))


(same-parity 1 2 3 4 5 6 7)
(same-parity 2 3 4 5 6 7)
