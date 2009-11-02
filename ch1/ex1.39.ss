;; Exercise 1.39

(define (cont-frac n d k)
  (define (iter result i)
    (if (= i 0)
        result
        (iter (/ (n i) (+ (d i) result)) (- i 1))))
  (iter 0 k))

(define (tan-cf x k)
  (define (n i)
    (if (= i 1)
        x
        (- (sqr x))))
  (define (d i)
    (- (* 2 i) 1))
  (cont-frac n d k))

;; test case
(tan-cf (/ pi 4) 10)
