#lang sicp

(define (deep-reverse tree)
  (define (deep-reverse-iter old new)
    (cond ((null? old) new)
	  ((not (pair? old)) old)
	  (else (deep-reverse-iter (cdr old)
				   (cons (deep-reverse (car old))
					 new)))))
  (deep-reverse-iter tree nil))


(define tree1 (list 1 2 (list 3 (list 4 5) 6) (list 7 8 (list 9)) 10))

tree1
(deep-reverse tree1)
