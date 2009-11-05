;; Exercise 2.12

(define (make-center-percent c p)
  (make-interval (* c (- 1 p)) (* c (+ 1 p))))
(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))
(define (percent i)
  (abs 
   (/ (- (upper-bound i) (lower-bound i)) (* 2 (center i)))))
(define make-interval cons)
(define lower-bound car)
(define upper-bound cdr)

(define test (make-center-percent -8 0.05))
test
(center test)
(percent test)
