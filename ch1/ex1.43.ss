;; Exercise 1.43

(define (compose-fun f g)
  (lambda (x) (f (g x))))

;; iterative
(define (repeated-i f n)
  (define (repeated-iter result i)
    (if (= i n)
        result
        (repeated-iter (compose-fun f result) (+ i 1))))
  (repeated-iter f 1))

;; recursive
(define (repeated-r f n)
  (if (= n 1)
      f
      (compose-fun f (repeated-r f (- n 1)))))

((repeated-i sqr 1) 5)
((repeated-r sqr 1) 5)

((repeated-i sqr 2) 5)
((repeated-r sqr 2) 5)

((repeated-i sqr 3) 5)
((repeated-r sqr 3) 5)

;; without help of compse-fun
(define (repeated f n)
  (if (= n 1)
      f
      (lambda (x) (f ((repeated f (- n 1)) x)))))
((repeated sqr 1) 5)
((repeated sqr 2) 5)
((repeated sqr 3) 5)
