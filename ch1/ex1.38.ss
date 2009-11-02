;; Exercise 1.38

(define (cont-frac n d k)
  (define (recur i)
    (if (= i k)
        (/ (n k) (d k))
        (/ (n i) (+ (d i) (recur (+ i 1))))))
  (recur 1))

(define (d i)
  (if (= 2 (remainder i 3))
      (* 2 (/ (+ i 1) 3))
      1))

(+ 2 (cont-frac (lambda (i) 1.0) d 20))
