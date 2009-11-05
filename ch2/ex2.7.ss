;; Exercise 2.7

(define (make-interval a b) (cons a b))

(define (lower-bound x)
  (min (car x) (cdr x)))

(define (upper-bound x)
  (max (car x) (cdr x)))

(lower-bound (make-interval 1 9))
(upper-bound (make-interval 7 -3))
