;; Exercise 2.65

;; The most straight forward way is to convert the balanced binary tree to
;; ordered list, and do the union or intersection operation, then convert the
;; list back to the balanced binary tree.
;;   tree -> list: theta(n)
;;   union or intersection in ordered list: theta(n)
;;   list -> tree: theta(n)
;; total: theta(n)

;; Note 1: the converting from tree to list is using tree->list-2 procedure in
;; Exercise 2.63, because in tree->list-1, `append' is used, and may cause the
;; procedure end up in order of theta(n*log(n)) steps since `append' is theta(n)
;; operation.

(define (tree->list tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
        result-list
        (copy-to-list (left-branch tree)
                      (cons (entry tree)
                            (copy-to-list (right-branch tree)
                                          result-list)))))
  (copy-to-list tree '()))

(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (make-tree entry left right)
  (list entry left right))

(define (list->tree elements)
  (car (partial-tree elements (length elements))))

(define (partial-tree elts n)
  (if (= n 0)
      (cons '() elts)
      (let ((left-size (quotient (- n 1) 2)))
        (let ((left-result (partial-tree elts left-size)))
          (let ((left-tree (car left-result))
                (non-left-elts (cdr left-result))
                (right-size (- n (+ left-size 1))))
            (let ((this-entry (car non-left-elts))
                  (right-result (partial-tree (cdr non-left-elts)
                                              right-size)))
              (let ((right-tree (car right-result))
                    (remaining-elts (cdr right-result)))
                (cons (make-tree this-entry left-tree right-tree)
                      remaining-elts))))))))

;; union-set
(define (union-set set1 set2)
  (let ((set-list1 (tree->list set1))
        (set-list2 (tree->list set2)))
    (define (union-list list1 list2)
      (cond ((null? list1) list2)
            ((null? list2) list1)
            ((< (car list1) (car list2))
             (cons (car list1) (union-list (cdr list1) list2)))
            ((= (car list1) (car list2))
             (cons (car list1) (union-list (cdr list1) (cdr list2))))
            (else (cons (car list2) (union-list list1 (cdr list2))))))
    (list->tree (union-list set-list1 set-list2))))

(define tree1 '(5 (1 () (3 () ())) (9 (7 () ()) (11 () ()))))
(define tree2 '(4 (2 () (3 () ())) (8 (7 () ()) (11 () ()))))
(union-set tree1 tree2)
(tree->list (union-set tree1 tree2))

;; intersection-set
(define (intersection-set set1 set2)
  (let ((set-list1 (tree->list set1))
        (set-list2 (tree->list set2)))
    (define (intersection-list list1 list2)
      (cond ((or (null? list1) (null? list2)) '())
            ((< (car list1) (car list2))
             (intersection-list (cdr list1) list2))
            ((= (car list1) (car list2))
             (cons (car list1) (intersection-list (cdr list1) (cdr list2))))
            (else (intersection-list list1 (cdr list2)))))
    (list->tree (intersection-list set-list1 set-list2))))

(intersection-set tree1 tree2)
(tree->list (intersection-set tree1 tree2))
