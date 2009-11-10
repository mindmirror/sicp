;; Exercise 2.35

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (enumerate-tree tree)
  (cond ((null? tree) null)
        ((not (pair? tree)) (list tree))
        (else (append (enumerate-tree (car tree))
                      (enumerate-tree (cdr tree))))))
      

(define (count-leaves t)
  (accumulate (lambda (x y) (+ 1 y))
              0
              (map enumerate-tree t)))

(count-leaves (list 1 2 (list 3 4 (list 5) 6) 7))

