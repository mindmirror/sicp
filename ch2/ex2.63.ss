;; Exercise 2.63

;; a.
;; They produce the same result for every tree.
;; The lists for trees in figure 2.16 is (1 3 5 7 9 11)

;; b.
;; They have the same order of growth, which is theta(n).

;; Note: the first procedure is a recursive process, while the second one is
;; iterative process. Just like the two factorial process in section 1.2.1.

(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define( right-branch tree) (caddr tree))
(define (make-tree entry left right)
  (list entry left right))

(define tree1 '(7 (3 (1 () ()) (5 () ())) (9 () (11 () ()))))
(define tree2 '(3 (1 () ()) (7 (5 () ()) (9 () (11 () ())))))
(define tree3 '(5 (3 (1 () ()) ()) (9 (7 () ()) (11 () ()))))
tree1
tree2
tree3

(define (tree->list-1 tree)
  (if (null? tree)
      '()
      (append (tree->list-1 (left-branch tree))
              (cons (entry tree)
                    (tree->list-1 (right-branch tree))))))

(tree->list-1 tree1)
(tree->list-1 tree2)
(tree->list-1 tree3)

(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
        result-list
        (copy-to-list (left-branch tree)
                      (cons (entry tree)
                            (copy-to-list (right-branch tree)
                                          result-list)))))
  (copy-to-list tree '()))

(tree->list-2 tree1)
(tree->list-2 tree2)
(tree->list-2 tree3)
