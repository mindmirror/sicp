;; Exercise 2.5

(define (cons-new a b)
  (* (fast-expt 2 a)
     (fast-expt 3 b)))

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (sqr (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(define (car-new x)
  (define (iter i x)
    (if (> (remainder x 2) 0)
        i
        (iter (+ i 1) (/ x 2))))
  (iter 0 x))

(define (cdr-new x)
  (define (iter i x)
    (if (> (remainder x 3) 0)
        i
        (iter (+ i 1) (/ x 3))))
  (iter 0 x))

(car-new (cons-new 7 15))
(cdr-new (cons-new 7 15))
