;; Exercise 2.2

(define (make-segment x y)
  (cons x y))

(define (start-segment x)
  (car x))

(define (end-segment x)
  (cdr x))

(define (make-point x y)
  (cons x y))

(define (x-point x)
  (car x))

(define (y-point x)
  (cdr x))

(define (midpoint-segment line)
  (make-point (/ (+ (x-point (start-segment line))
                    (x-point (end-segment line)))
                 2)
              (/ (+ (y-point (start-segment line))
                    (y-point (end-segment line)))
                 2)))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ", ")
  (display (y-point p))
  (display ")"))

(print-point (midpoint-segment
              (make-segment (make-point 1 2)
                            (make-point 3 4))))
