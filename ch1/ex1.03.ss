;; Exercise 1.3.  Define a procedure that takes three numbers as arguments
;; and returns the sum of the squares of the two larger numbers. 

(define (square x) (* x x))

(define (square-large x y z) 
  (cond ((and (< x y) (< x z)) (+ (square y) (square z)))
        ((and (< y x) (< y z)) (+ (square x) (square z)))
        ((and (< z x) (< z y)) (+ (square x) (square y)))))

;; Test case
(square-large 1 2 3)
(square-large 1 3 2)
(square-large 2 1 3)
(square-large 2 3 1)
(square-large 3 1 2)
(square-large 3 2 1)
