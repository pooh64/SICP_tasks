#lang sicp

(define (map proc items)
  (if (null? items)
      nil
      (cons (proc (car items))
	    (map proc (cdr items)))))

(define (square x) (* x x))

(define (square-tree tree)
  (cond ((null? tree) nil)
	((not (pair? tree)) (square tree))
	(else (cons (square-tree (car tree))
		    (square-tree (cdr tree))))))

(define (square-tree-map tree)
  (map (lambda (tree)
	 (cond ((null? tree) nil)
	       ((not (pair? tree)) (square tree))
	       (else (square-tree-map tree))))
       tree))


(define l1
  (list 1
	(list 2 (list 3 4) 5)
	(list 6 7)))

l1
(square-tree l1)
(square-tree-map l1)
