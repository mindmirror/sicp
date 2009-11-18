;; Exercise 2.54

(define (my-equal? seq1 seq2)
  (cond ((and (not (pair? seq1)) (not (pair? seq2)))
         (eq? seq1 seq2))
        ((and (pair? seq1) (pair? seq2))
         (if (my-equal? (car seq1) (car seq2))
             (my-equal? (cdr seq1) (cdr seq2))
             false))
        (else false)))

;; a more elegant way
(define (my-equal2? seq1 seq2)
  (cond ((and (not (pair? seq1)) (not (pair? seq2)))
         (eq? seq1 seq2))
        ((and (pair? seq1) (pair? seq2))
         (and (my-equal2? (car seq1) (car seq2))
              (my-equal2? (cdr seq1) (cdr seq2))))
        (else false)))

(my-equal? '(this is a list) '(this is a list))
(my-equal? '(this is a list) '(this (is a) list))
(my-equal? '(this (is (a) list)) '(this (is (a) list)))

(my-equal2? '(this is a list) '(this is a list))
(my-equal2? '(this is a list) '(this (is a) list))
(my-equal2? '(this (is (a) list)) '(this (is (a) list)))
