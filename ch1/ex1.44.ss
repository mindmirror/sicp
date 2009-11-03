;; Exercise 1.44

(define (repeated f n)
  (if (= n 1)
      f
      (lambda (x) (f ((repeated f (- n 1)) x)))))

(define dx 0.00001)
(define (average a b c)
  (/ (+ a b c) 3))
(define (smooth f)
  (lambda (x) (average (f (- x dx)) (f x) (f (+ x dx)))))

(define (n-fold-smooth f n)
  ((repeated smooth n) f))

;; test case
(sin (/ pi 4))
((smooth sin) (/ pi 4))
((n-fold-smooth sin 10) (/ pi 4))
