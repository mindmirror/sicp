;; Exercise 1.41

(define (double f)
  (lambda (x) (f (f x))))

(define (inc x) (+ x 1))

(((double (double double)) inc) 5)

;; (((double (double double)) inc) 5) =>
;; (((double (lambda (x) (double (double x)))) inc) 5)
;; name the (lambda (x) (double (double x))) to dd
;; (((double dd) inc) 5) =>
;; ((lambda (x) (dd (dd x))) inc 5) =>
;; ((dd (dd inc)) 5) =>
;; expand dd
;; ((dd (double (double inc))) 5) =>
;; ((double (double (double (double inc)))) 5) =>
;; 21
