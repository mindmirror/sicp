;; Exercise 1.46

(define (iterative-improve good-enough? improve)
  (define (try guess)
       (if (good-enough? guess)
           guess
           (try (improve guess))))
  (lambda (first-guess) (try first-guess)))

(define torlerance 0.00001)

;; square root
(define (square-root first-guess x)
  (define (improve guess)
    (/ (+ guess (/ x guess)) 2))
  (define (good-enough? guess)
    (< (abs (- (sqr guess) x)) torlerance))
  ((iterative-improve good-enough? improve) first-guess))

(square-root 1.0 4)

;; fixed-point
(define (fixed-point f first-guess)
  (define (improve guess)
    (f guess))
  (define (good-enough? guess)
    (< (abs (- guess (f guess))) torlerance))
  ((iterative-improve good-enough? improve) first-guess))

(fixed-point cos 1.0)
