;; Exercise 2.8

;; The minimum value the subtraction could be is the value of the lower bounds of the
;; first interval subtracts the upper bounds of the second interval.
;; The maximum value the subtraction could be is the value of the upper bounds of the
;; first interval subtracts the lower bounds of the second interval.

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))

(define (make-interval a b) (cons a b))
(define (lower-bound x) (car x))
(define (upper-bound x) (cdr x))

(sub-interval (make-interval 3 7)
              (make-interval 1 8))
