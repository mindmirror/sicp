;; Exercise 2.39

(define (fold-right op init seq)
  (if (null? seq)
      init
      (op (car seq)
          (fold-right op init (cdr seq)))))

(define (fr-reverse sequence)
  (fold-right (lambda (x y) (append y (list x))) null sequence))

(fr-reverse (list 1 2 3 4))

(define (fold-left op init sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op (car rest) result) (cdr rest))))
  (iter init sequence))

(define (fl-reverse sequence)
  (fold-left (lambda (x y) (cons x y)) null sequence))

(fl-reverse (list 1 2 3 4))
