#lang sicp

(define (tree-map proc tree)
  (cond ((null? tree) nil)
	((not (pair? tree)) (proc tree))
	(else (cons (tree-map proc (car tree))
		    (tree-map proc (cdr tree))))))

(define (square x) (* x x))
(define (square-tree tree) (tree-map square tree))

(define l1
  (list 1
	(list 2 (list 3 4) 5)
	(list 6 7)))

l1
(square-tree l1)
