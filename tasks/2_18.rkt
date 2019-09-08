#lang sicp

(define (reverse items)
  (define (reverse-iter items items-r)
    (if (null? items)
	items-r
	(reverse-iter (cdr items) (cons (car items) items-r))))
  (reverse-iter items nil))

(reverse (list 1 2 3 4))
