;; Exercise 2.1

(define (numer x)
  (car x))

(define (denom x)
  (cdr x))

(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))

(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (numer y) (denom x))))

(define (make-rat n d)
  (let ((g (gcd n d))) ;; This is built in gcd procedure, it handles negtive integer
    (if (< d 0)
        (cons (- (/ n g)) (- (/ d g)))
        (cons (/ n g) (/ d g)))))

(define (print-rat rat)
  (newline)
  (display (numer rat))
  (display "/")
  (display (denom rat)))

(define five-nineth (make-rat 5 9))
(define minus-two-nineth (make-rat 2 -9))
(print-rat five-nineth)
(print-rat minus-two-nineth)
(print-rat (add-rat five-nineth minus-two-nineth))
(print-rat (sub-rat minus-two-nineth five-nineth))
(print-rat (make-rat -3 -7))
