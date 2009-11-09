;; Exercise 2.33

;; accumulate
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

;; (map p sequence)
(define (my-map p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) null sequence))

(my-map sqr (list 1 2 3 4))

;; (append seq1 seq2)
(define (my-append seq1 seq2)
  (accumulate cons seq2 seq1))

(my-append (list 1 2 3 4) (list 5 6 7 8))
(my-append (list 1 2 (list 3 4)) (list 5 6))

;; (length sequence)
(define (my-length sequence)
  (accumulate (lambda (x y) (+ 1 y))  0 sequence))

(my-length (list 1 2 3 4 5 6 7))
(my-length (list 1 2 (list 3 4)))
