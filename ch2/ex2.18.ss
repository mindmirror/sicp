;; Exercise 2.18

;; iterative
(define (reverse-i list)
  (define (reverse-iter items result-list)
    (if (null? items)
        result-list
        (reverse-iter (cdr items) (cons (car items) result-list))))
  (reverse-iter list '()))

;; recursive
(define (reverse-r items)
  (if (null? items)
      '()
      (append (reverse-r (cdr items)) (list (car items)))))

(reverse-i (list 1 2 3 4))
(reverse-i '())

(reverse-r (list 1 4 9 16 25))
(reverse-r '())
