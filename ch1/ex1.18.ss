;; Exercise 1.18.  Using the results of exercises 1.16 and 1.17, devise a
;; procedure that generates an iterative process for multiplying two integers
;; in terms of adding, doubling, and halving and uses a logarithmic number of
;; steps.

(define (fast-mul a b)
  (fast-mul-iter 0 a b))

(define (fast-mul-iter p a b)
  (cond ((= b 0) p)
        ((even? b) (fast-mul-iter p (double a) (halve b)))
        (else (fast-mul-iter (+ p a) a (- b 1)))))

(define (double n)
  (+ n n))

(define (halve n)
  (/ n 2))
