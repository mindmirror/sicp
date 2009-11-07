;; Exercise 2.21

(define (square-list items)
  (if (null? items)
      null
      (cons (sqr (car items)) (square-list (cdr items)))))

(square-list (list 1 2 3 4 5 6 7))

(define (square-list2 items)
  (map sqr items))

(square-list2 (list 1 2 3 4 5 6 7))
