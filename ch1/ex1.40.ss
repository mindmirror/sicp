;; Exercise 1.40

(define (cubic a b c)
  (lambda (x) (+ (* x x x)
                 (* a x x)
                 (* b x)
                 c)))

;; define derivative
(define dx 0.00001)
(define (deriv g)
  (lambda (x) (/ (- (g (+ x dx)) (g x)) dx)))
;; newton transform
(define (newton-transform f)
  (lambda (x) (- x (/ (f x) ((deriv f) x)))))
;; newton's method
(define (newton-method f guess)
  (fixed-point (newton-transform f) guess))
;; fixed point
(define (fixed-point f first-guess)
  (define torlerance 0.00001)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) torlerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          guess
          (try next))))
  (try first-guess))

(newton-method (cubic 1 1 1) 1)
;; The expected root is -1
