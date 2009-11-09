;; Exercise 2.31

;; directly tree map
(define (tree-map proc tree)
  (cond ((null? tree) null)
        ((not (pair? tree)) (proc tree))
        (else (cons (tree-map proc (car tree))
                    (tree-map proc (cdr tree))))))

(define (map-tree-map proc tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (map-tree-map proc sub-tree)
             (proc sub-tree)))
       tree))

(tree-map sqr
          (list 1
                (list 2 (list 3 4) 5)
                (list 6 7)))

(map-tree-map sqr
              (list 1
                (list 2 (list 3 4) 5)
                (list 6 7)))

              