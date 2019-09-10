#lang sicp

(define (fringe tree)
  (cond ((null? tree) nil)
	((not (pair? tree)) (list tree))
	(else (append (fringe (car tree))
		      (fringe (cdr tree))))))

(define tree1 (list 1 2 (list 3) (list 4 (list 5 6) 7) 8))

tree1
(fringe tree1)
