;; Exercise 1.35. Show that the golden ratio psi (section 1.2.2) is a fixed 
;; point of the transformation x -> 1 + 1/x, and use this fact to compute  by
;; means of the fixed-point procedure.

;; x = 1 + 1/x
;; Multiply x to both sides of the equation
;; x^2 = x + 1
;; It can be seen obviously that golden ratio psi satisfies the equation.
;; So psi is one of the fixed point

(define torlerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? a b)
    (< (abs (- a b)) torlerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          guess
          (try next))))
  (try first-guess))

(fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0)
