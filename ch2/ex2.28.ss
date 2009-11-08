;; Exercise 2.28

(define (fringe items)
  (cond ((null? items) null)
        ((not (pair? items)) (list items))
        (else (append (fringe (car items)) (fringe (cdr items))))))

;; This is not really a iterative process
(define (fringe-i items)
  (define (iter i result)
    (cond ((null? i) result)
          ((pair? (car i)) (iter (cdr i) (append result (iter (car i) null))))
          (else (iter (cdr i) (append result (list (car i)))))))
  (iter items null))

;; Test case
(define x (list (list 1 2) (list 3 4)))
x
(fringe x)
(fringe (list x x))

(fringe-i x)
(fringe-i (list x x))
 
