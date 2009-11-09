;; Exercise 2.30

;; square tree directly
(define (square-tree tree)
  (cond ((null? tree) null)
        ((not (pair? tree)) (sqr tree))
        (else (cons (square-tree (car tree))
                    (square-tree (cdr tree))))))

(square-tree
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7)))

;; square tree with map
(define (map-square-tree tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (map-square-tree sub-tree)
             (sqr sub-tree)))
       tree))

(map-square-tree
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7)))
