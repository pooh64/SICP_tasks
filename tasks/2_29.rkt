#lang sicp

(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (car (cdr mobile)))

(define (branch-lenght branch)
  (car branch))

(define (branch-structure branch)
  (car (cdr branch)))

(define (weight? mobile)
  (not (pair? mobile)))

(define (total-weight mobile)
  (if (weight? mobile)
      mobile
      (+ (total-weight (branch-structure (left-branch  mobile)))
	 (total-weight (branch-structure (right-branch mobile))))))

(define (balanced? mobile)
  (define (balanced-reduce mobile)
    (define (balanced-reduce-try mobile left-l right-l left-s right-s)
      (if (and (weight? left-s)
	       (weight? right-s)
	       (= (* left-l  left-s)
		  (* right-l right-s)))
	  (+ left-s right-s)
	  mobile))
    (if (weight? mobile)
	mobile
	(let ((left-b  (left-branch  mobile))
	      (right-b (right-branch mobile)))
	  (balanced-reduce-try mobile
			       (branch-lenght left-b)
			       (branch-lenght right-b)
			       (balanced-reduce (branch-structure left-b))
			       (balanced-reduce (branch-structure right-b))))))
  (weight? (balanced-reduce mobile)))


(define mobile1 (make-mobile (make-branch 3 4)
			     (make-branch 2 6)))

(define mobile2 (make-mobile (make-branch 1 (* 2 (total-weight mobile1)))
			     (make-branch 2 mobile1)))

(define mobile3 (make-mobile (make-branch 1 2)
			     (make-branch 2 3)))

(balanced? mobile1)	; #t
(balanced? mobile2)	; #t
(balanced? mobile3)	; #f
