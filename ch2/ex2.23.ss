;; Exercise 2.23

(define (my-for-each proc items)
  (cond ((not (null? items))
         (proc (car items))
         (my-for-each proc (cdr items)))))

(my-for-each (lambda (x) (newline) (display x))
             (list 57 321 88))

(my-for-each (lambda (x) (newline) (display x))
             (list 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15))
